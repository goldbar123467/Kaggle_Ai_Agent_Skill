# Example: Checking Kernel Status

## Scenario
You've pushed a notebook to Kaggle and want to monitor its progress.

## Command
```
/kaggle status clarkkitchen/notebooktest1
```

## What Claude Does
1. Runs `kaggle kernels status clarkkitchen/notebooktest1`
2. Parses the response
3. Provides a human-readable summary

## Example Interaction

**You:**
```
/kaggle status clarkkitchen/notebooktest1
```

**Claude:**
```
✅ Kernel Status Check

Kernel: clarkkitchen/notebooktest1
Status: RUNNING

The kernel is currently executing. Check back in a few minutes
or run this command again to see if it's complete.

🔗 View live: https://www.kaggle.com/code/clarkkitchen/notebooktest1
```

## Possible Statuses

| Status | Meaning |
|--------|---------|
| `RUNNING` | Kernel is currently executing |
| `COMPLETE` | Finished successfully - results available |
| `ERROR` | Failed - check logs for details |
| `CANCELLED` | Manually stopped |

## Follow-up Commands

After the kernel completes:
```
/kaggle results clarkkitchen/notebooktest1
```
