---
name: kaggle
description: Kaggle CLI tools - manage notebooks, check status, download outputs, view results
arguments:
  - name: action
    description: "Action: status, push, pull, list, submit, download, results, datasets, competitions"
    required: false
  - name: target
    description: "Kernel name (e.g., username/notebook-name) or competition name"
    required: false
---

# Kaggle Tools for Claude Code

You are helping the user manage their Kaggle notebooks and competition submissions.

## CRITICAL SAFETY RULES

**ALWAYS ask for confirmation before:**
- Pushing/updating kernels (`kaggle kernels push`)
- Submitting to competitions (`kaggle competitions submit`)
- Any action that modifies their Kaggle account

**Format for asking:**
```
I'm about to [action]. Here's what will happen:
- [details]

Do you want me to proceed? (yes/no)
```

## Available Commands

### 1. `status` - Check kernel run status
Check if a kernel is running, complete, or errored.

```bash
kaggle kernels status {username/kernel-name}
```

**Example response:**
```
Kernel clarkkitchen/notebooktest1 has status "RUNNING"
Started: 10 minutes ago
```

### 2. `push` - Push/update a kernel (REQUIRES CONFIRMATION)

Before pushing, ALWAYS:
1. Show the user what will be pushed (files, metadata)
2. Ask: "Do you want me to push this to Kaggle? (yes/no)"
3. Only proceed if they explicitly confirm

```bash
kaggle kernels push -p {path-to-kernel-folder}
```

### 3. `pull` - Download kernel source code

```bash
kaggle kernels pull {username/kernel-name} -p {destination}
```

### 4. `download` / `output` - Download kernel outputs

```bash
kaggle kernels output {username/kernel-name} -p {destination}
```

### 5. `list` - List user's kernels

```bash
kaggle kernels list --mine
```

### 6. `submit` - Submit to competition (REQUIRES CONFIRMATION)

Before submitting, ALWAYS:
1. Show the submission file and competition name
2. Ask: "Do you want me to submit this? (yes/no)"
3. Only proceed if they explicitly confirm

```bash
kaggle competitions submit -c {competition} -f {file} -m "{message}"
```

### 7. `competitions` - List active competitions

```bash
kaggle competitions list
```

### 8. `datasets` - Search datasets

```bash
kaggle datasets list -s "{search-term}"
```

### 9. `results` - Download and display kernel results

This is a compound action that:

**Step 1:** Download kernel output
```bash
kaggle kernels output {username/kernel-name} -p {temp-folder}
```

**Step 2:** Find and parse parquet files
```python
import pandas as pd

df = pd.read_parquet('{parquet_file}')

print(f"Results: {len(df)} rows")
print(f"Columns: {df.columns.tolist()}")
print()
print(df.to_string(index=False))

if 'answer' in df.columns:
    print(f"\n--- Statistics ---")
    print(f"Total: {len(df)}")
    print(f"Unique answers: {df['answer'].nunique()}")
    print(f"Distribution:")
    print(df['answer'].value_counts().head(10))
```

**Step 3:** Compare with reference answers (if available)
```python
import pandas as pd

sub = pd.read_parquet('{submission}')
ref = pd.read_csv('{reference}')[['id', 'answer']]
ref.columns = ['id', 'correct_answer']

merged = sub.merge(ref, on='id', how='left')

correct = 0
total = 0

print(f"{'ID':12} | {'Submitted':>10} | {'Correct':>10} | Status")
print("-" * 55)

for _, row in merged.iterrows():
    submitted = row['answer']
    correct_ans = row.get('correct_answer', None)

    if pd.notna(correct_ans):
        total += 1
        match = submitted == correct_ans
        if match:
            correct += 1
        status = "✓ CORRECT" if match else "✗ WRONG"
        correct_str = str(int(correct_ans))
    else:
        status = "? (no ref)"
        correct_str = "N/A"

    print(f"{row['id']:12} | {submitted:>10} | {correct_str:>10} | {status}")

if total > 0:
    pct = correct / total * 100
    print(f"\n{'='*55}")
    print(f"Score: {correct}/{total} ({pct:.1f}%)")
```

**Step 4:** Show relevant log entries
```bash
grep -E "(Error|Problem|answer=|loaded|URGENT|WARNING|Confident|Score)" {log_file} | tail -30
```

## Interactive Mode

If the user just says `/kaggle` without arguments, present these options:

1. Check kernel status
2. View kernel results
3. List my kernels
4. Push a notebook
5. Submit to competition
6. Search datasets/competitions

Ask: "What would you like to do?"

## Response Formatting

After running commands, always provide:

1. **Clear summary** of what happened
2. **Relevant URLs** (kernel page, submission page)
3. **Next steps** if applicable

**Example:**
```
✅ Kernel status: COMPLETE

📊 Results downloaded to: ./outputs/
   - submission.parquet (50 rows)

🔗 View at: https://www.kaggle.com/code/username/kernel-name

Next: Run `/kaggle results username/kernel-name` to see formatted output
```
