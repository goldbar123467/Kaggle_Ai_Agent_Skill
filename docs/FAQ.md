# Frequently Asked Questions

## Why Use This?

### What problem does this solve?

**The old way (without this skill):**
```bash
# Check if your kernel is done
kaggle kernels status myname/my-kernel

# Download the results
kaggle kernels output myname/my-kernel -p ./outputs

# Now manually open the parquet file somehow...
python -c "import pandas as pd; print(pd.read_parquet('./outputs/submission.parquet'))"

# Compare against answers manually...
# Check logs manually...
# Repeat 50 times during a competition...
```

**The new way (with this skill):**
```
/kaggle results myname/my-kernel
```

That's it. One command. Beautifully formatted. Automatically compared against reference answers. Done.

### Does it actually make Kaggle easier?

**Yes.** Here's the honest breakdown:

| Task | Without Skill | With Skill |
|------|---------------|------------|
| Check kernel status | Terminal → type command → read raw output | `/kaggle status` → clear summary |
| View results | Download → install pyarrow → write Python → parse → format | `/kaggle results` → instant table |
| Compare answers | Manual spreadsheet work | Automatic with accuracy % |
| Push notebook | Remember exact command + flags | `/kaggle push` with safety check |

**Time saved per competition:** Hours. Seriously.

### Who is this for?

**Beginners:**
- You don't need to memorize Kaggle CLI commands
- Just type `/kaggle` and Claude guides you
- Plain English, no terminal expertise required

**Intermediate users:**
- Faster iteration during competitions
- Instant result comparison without writing scripts
- One less context switch (stay in Claude Code)

**Experts:**
- Integrates into your AI-assisted workflow
- Batch operations through natural language
- Extend it - it's open source

### How does it actually work?

Simple version:
1. You type `/kaggle results my-kernel`
2. Claude runs the Kaggle CLI commands for you
3. Claude parses the output (parquet files, logs)
4. Claude formats it nicely and shows you

Think of it as having an assistant who knows all the Kaggle commands so you don't have to.

### Is this official Kaggle software?

No. This is a community plugin for Claude Code that uses the official [Kaggle API](https://github.com/Kaggle/kaggle-api). It's a convenience layer, not a replacement.

### Will this help me win competitions?

This tool helps you **work faster**, not smarter. You still need:
- Good models
- Smart feature engineering
- Domain knowledge

But you'll spend less time fighting with CLI commands and more time on the actual problem.

---

## Setup & Installation

### How do I set up Kaggle credentials?

1. Go to [kaggle.com](https://www.kaggle.com)
2. Click on your profile → **Account**
3. Scroll to **API** section
4. Click **Create New API Token**
5. Save the downloaded `kaggle.json` to `~/.kaggle/`
6. Set permissions: `chmod 600 ~/.kaggle/kaggle.json`

### The install script says "Kaggle CLI not found"

Install the Kaggle CLI:
```bash
pip install kaggle
```

### How do I know if it's installed correctly?

After installation, restart Claude Code and type:
```
/kaggle list
```

If you see your kernels, it's working!

---

## Usage

### Why does it ask before pushing/submitting?

**Safety first.** These actions modify your Kaggle account:
- Pushing updates your kernels (could overwrite code)
- Submitting counts toward competition limits

The confirmation gives you a chance to review before proceeding.

### Can I skip the confirmation?

No, and that's intentional. The confirmation exists to prevent accidental pushes or submissions that could affect your competition standing.

### What if I don't have pyarrow installed?

The `/kaggle results` command needs pyarrow to read parquet files:
```bash
pip install pyarrow pandas
```

### Can I use this offline?

No. All commands require internet access to communicate with Kaggle's API.

---

## Troubleshooting

### "403 Forbidden" error

Your Kaggle credentials may be expired or invalid:
1. Generate a new API token on kaggle.com
2. Replace `~/.kaggle/kaggle.json`
3. Try again

### "Kernel not found" error

Check that:
- The kernel name is correct (format: `username/kernel-name`)
- You have access to the kernel (public or your own)

### Results show "? (no reference)"

This means no reference answers were found to compare against. This is normal for:
- Real competition submissions (answers are hidden)
- Kernels without a reference.csv file

### Push fails with "dataset sources not valid"

The kernel metadata may reference datasets you don't have access to. Check your `kernel-metadata.json` for:
- Correct dataset paths
- Datasets you have access to

---

## Competition-Specific

### Can I use this with any Kaggle competition?

Yes! The skill works with all Kaggle competitions and notebooks.

### How do I check my competition submissions?

```
/kaggle results username/kernel-name
```

This downloads and displays your submission results.

### What's the best workflow for competitions?

1. Develop locally
2. `/kaggle push` to upload
3. Wait for kernel to complete
4. `/kaggle status` to check progress
5. `/kaggle results` to see how you did

---

## Still have questions?

Open an issue on [GitHub](https://github.com/goldbar123467/Kaggle_Ai_Agent_Skill/issues)
