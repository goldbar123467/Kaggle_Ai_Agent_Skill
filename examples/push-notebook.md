# Example: Pushing a Notebook

## Scenario
You've updated your competition notebook locally and want to push it to Kaggle.

## Command
```
/kaggle push
```

## What Claude Does
1. Locates the kernel-metadata.json
2. Shows you what will be pushed
3. **Asks for confirmation** (required)
4. Only pushes if you say yes

## Example Interaction

**You:**
```
/kaggle push
```

**Claude:**
```
📋 Push Notebook to Kaggle

I found a kernel ready to push:

📁 Folder: ./kaggle_submit/
📄 Files:
   - kernel-metadata.json
   - notebook.ipynb (15.2 KB)

📝 Metadata:
   - Title: notebooktest1
   - ID: clarkkitchen/notebooktest1
   - GPU: Enabled
   - Internet: Disabled
   - Competition: ai-mathematical-olympiad-progress-prize-3

⚠️  This will update your existing kernel on Kaggle.

Do you want me to push this? (yes/no)
```

**You:**
```
yes
```

**Claude:**
```
🚀 Pushing to Kaggle...

✅ Kernel version 12 successfully pushed!

🔗 View at: https://www.kaggle.com/code/clarkkitchen/notebooktest1

The kernel will start running shortly. Check status with:
   /kaggle status clarkkitchen/notebooktest1
```

## If You Say No

**You:**
```
no
```

**Claude:**
```
👍 Push cancelled. No changes were made to Kaggle.

Let me know when you're ready to push, or if you'd like to
make any changes first.
```

## Setting Up kernel-metadata.json

Your kernel folder needs a `kernel-metadata.json` file:

```json
{
  "id": "username/kernel-name",
  "title": "My Kernel Title",
  "code_file": "notebook.ipynb",
  "language": "python",
  "kernel_type": "notebook",
  "is_private": true,
  "enable_gpu": true,
  "enable_internet": false,
  "competition": "competition-slug",
  "model_sources": [
    "deepseek-ai/deepseek-r1/transformers/deepseek-r1-distill-qwen-7b/2"
  ]
}
```

## Tips

- Always review the files before confirming
- The kernel ID determines if it creates new or updates existing
- Check kernel status after pushing to monitor execution
