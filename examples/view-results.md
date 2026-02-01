# Example: Viewing Kernel Results

## Scenario
Your competition kernel has finished running. You want to see the results and how you scored.

## Command
```
/kaggle results clarkkitchen/notebooktest1
```

## What Claude Does
1. Downloads kernel outputs (parquet files, logs)
2. Parses the submission parquet
3. Compares against reference answers (if available)
4. Displays formatted results with accuracy

## Example Interaction

**You:**
```
/kaggle results clarkkitchen/notebooktest1
```

**Claude:**
```
📥 Downloading kernel outputs...
   - submission.parquet (50 rows)
   - notebooktest1.log

==================================================
KERNEL RESULTS: clarkkitchen/notebooktest1
==================================================

Results: 50 problems answered
Columns: ['id', 'answer']

ID           |  Submitted |    Correct | Status
-----------------------------------------------
0e644e       |        336 |        336 | ✓ CORRECT
26de63       |      32951 |      32951 | ✓ CORRECT
424e18       |      21818 |      21818 | ✓ CORRECT
42d360       |      32193 |      32193 | ✓ CORRECT
641659       |      57000 |      57447 | ✗ WRONG
86e8e5       |       8687 |       8687 | ✓ CORRECT
92ba6a       |         50 |         50 | ✓ CORRECT
9c1c5f       |        580 |        580 | ✓ CORRECT
a295e9       |        520 |        520 | ✓ CORRECT
dd7f5e       |        160 |        160 | ✓ CORRECT
...

=======================================================
Score: 47/50 (94.0%)
=======================================================

📋 Key Log Entries:
   - Model loaded in 136s
   - Problem 1: answer=336 (Confident 100%)
   - Problem 5: Timeout after 300s, using fallback
   - Total runtime: 4h 23m

🔗 View full logs: ./outputs/notebooktest1.log
```

## What If No Reference Exists?

For real competition submissions (where answers are hidden):

```
ID           |  Submitted |    Correct | Status
-----------------------------------------------
problem_01   |        336 |        N/A | ? (no reference)
problem_02   |      32951 |        N/A | ? (no reference)
...

Note: Reference answers not available for this competition.
Check the Kaggle leaderboard for your actual score.
```

## Tips

- Results are saved locally so you can review them later
- Use this after every kernel run to track improvements
- Compare multiple runs to see which approach works best
