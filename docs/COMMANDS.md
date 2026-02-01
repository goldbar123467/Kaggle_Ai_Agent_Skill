# Command Reference

Complete documentation for all `/kaggle` commands.

---

## `/kaggle status <kernel>`

Check the current run status of a Kaggle kernel.

**Usage:**
```
/kaggle status username/kernel-name
```

**Example:**
```
/kaggle status clarkkitchen/notebooktest1
```

**Output:**
```
clarkkitchen/notebooktest1 has status "KernelWorkerStatus.RUNNING"
```

**Possible statuses:**
- `RUNNING` - Kernel is currently executing
- `COMPLETE` - Kernel finished successfully
- `ERROR` - Kernel failed with an error
- `CANCELLED` - Kernel was manually stopped

---

## `/kaggle results <kernel>`

Download and display formatted results from a kernel run.

**Usage:**
```
/kaggle results username/kernel-name
```

**What it does:**
1. Downloads kernel output files (parquet, logs)
2. Parses submission parquet files
3. Displays formatted results table
4. Compares against reference answers (if available)
5. Shows key log entries

**Example output:**
```
==================================================
KERNEL RESULTS: clarkkitchen/notebooktest1
==================================================

Results: 50 problems answered
Columns: ['id', 'answer']

ID           |  Submitted |    Correct | Status
-----------------------------------------------
problem_01   |        336 |        336 | ✓ CORRECT
problem_02   |      32951 |      32951 | ✓ CORRECT
problem_03   |         42 |      21818 | ✗ WRONG
...

Score: 47/50 (94.0%)
```

---

## `/kaggle list`

List all kernels owned by you.

**Usage:**
```
/kaggle list
```

**Output:**
```
ref                              title              lastRunTime
-----------------------------    ---------------    --------------------------
clarkkitchen/notebooktest1       notebooktest1      2026-02-01 01:44:44
clarkkitchen/aimo-submission     AIMO Submission    2026-01-31 23:25:40
```

---

## `/kaggle push`

Push a notebook to Kaggle. **Requires confirmation.**

**Usage:**
```
/kaggle push
```

**Process:**
1. Claude shows you what will be pushed
2. Asks for confirmation
3. Only proceeds if you say "yes"

**Requirements:**
- `kernel-metadata.json` in the notebook folder
- Valid Kaggle credentials

---

## `/kaggle pull <kernel>`

Download the source code of a kernel.

**Usage:**
```
/kaggle pull username/kernel-name
```

**Example:**
```
/kaggle pull clarkkitchen/notebooktest1
```

Downloads the notebook source to the current directory.

---

## `/kaggle submit`

Submit a file to a Kaggle competition. **Requires confirmation.**

**Usage:**
```
/kaggle submit
```

**Process:**
1. Claude asks which competition and file
2. Shows submission details
3. Asks for confirmation
4. Only proceeds if you say "yes"

---

## `/kaggle competitions`

List active Kaggle competitions.

**Usage:**
```
/kaggle competitions
```

---

## `/kaggle datasets <query>`

Search for Kaggle datasets.

**Usage:**
```
/kaggle datasets deepseek
```

**Output:**
```
ref                                  title                    size
---------------------------------    ---------------------    --------
deepseek-ai/deepseek-r1              DeepSeek R1              50GB
...
```

---

## Interactive Mode

Just type `/kaggle` without arguments to enter interactive mode.

Claude will ask what you want to do and guide you through the options.
