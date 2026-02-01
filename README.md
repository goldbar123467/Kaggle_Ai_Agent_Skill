# Kaggle AI Agent Skill

![Claude Code](https://img.shields.io/badge/Claude_Code-Plugin-blueviolet)
![License](https://img.shields.io/badge/License-MIT-green)
![Version](https://img.shields.io/badge/Version-1.0.0-blue)
![Kaggle](https://img.shields.io/badge/Kaggle-API-20BEFF)

> **A Claude Code skill for managing Kaggle notebooks, competitions, and submissions with natural language.**

Just type `/kaggle` and let your AI assistant handle the rest - checking kernel status, viewing results, pushing notebooks, and more.

---

## Features

| Feature | Description |
|---------|-------------|
| **Check Status** | Monitor your kernel runs in real-time |
| **View Results** | Parse and display parquet outputs beautifully |
| **Compare Answers** | Automatically compare against reference data |
| **Push Notebooks** | Deploy kernels with safety confirmations |
| **Submit to Competitions** | Submit with built-in safeguards |
| **List Resources** | Browse kernels, datasets, and competitions |

## Quick Install

```bash
git clone https://github.com/goldbar123467/Kaggle_Ai_Agent_Skill.git
cd Kaggle_Ai_Agent_Skill
./install.sh
```

Then restart Claude Code and type `/kaggle` to get started.

## Requirements

- [Claude Code](https://claude.ai/code) installed
- [Kaggle CLI](https://github.com/Kaggle/kaggle-api) configured with API credentials
  ```bash
  pip install kaggle
  # Place kaggle.json in ~/.kaggle/
  ```

## Usage

### Check Kernel Status
```
/kaggle status username/kernel-name
```
Returns the current run status (running, complete, error).

### View Results
```
/kaggle results username/kernel-name
```
Downloads and displays:
- Formatted table of all outputs
- Answer statistics and distribution
- Comparison with reference answers (if available)
- Key log entries (errors, timing, etc.)

### Push a Notebook
```
/kaggle push
```
**Always asks for confirmation before pushing.** Shows you exactly what will be uploaded.

### List Your Kernels
```
/kaggle list
```

### Submit to Competition
```
/kaggle submit
```
**Always asks for confirmation.** Shows submission details before proceeding.

## Command Reference

| Command | Description | Safety |
|---------|-------------|--------|
| `/kaggle` | Interactive menu | - |
| `/kaggle status <kernel>` | Check run status | Read-only |
| `/kaggle results <kernel>` | View formatted results | Read-only |
| `/kaggle pull <kernel>` | Download source code | Read-only |
| `/kaggle list` | List your kernels | Read-only |
| `/kaggle competitions` | List competitions | Read-only |
| `/kaggle datasets <query>` | Search datasets | Read-only |
| `/kaggle push` | Push notebook | **Asks first** |
| `/kaggle submit` | Submit to competition | **Asks first** |

## Example Output

```
==================================================
KERNEL RESULTS: clarkkitchen/notebooktest1
==================================================

Results: 50 problems answered
Columns: ['id', 'answer']

ID         |  Submitted |    Correct | Status
--------------------------------------------------
problem_01 |        336 |        336 | ✓ CORRECT
problem_02 |      32951 |      32951 | ✓ CORRECT
problem_03 |      21818 |      21818 | ✓ CORRECT
...

Score: 47/50 (94.0%)
```

## Project Structure

```
Kaggle_Ai_Agent_Skill/
├── README.md           # You are here
├── install.sh          # One-command installer
├── LICENSE             # MIT License
├── plugin/             # The skill plugin
│   ├── plugin.json
│   └── commands/
│       └── kaggle.md
├── docs/               # Documentation
│   ├── COMMANDS.md
│   └── FAQ.md
└── examples/           # Usage examples
```

## FAQ

**Q: Why does it ask before pushing/submitting?**
A: To prevent accidental modifications to your Kaggle account. You're always in control.

**Q: How do I set up Kaggle credentials?**
A: Go to kaggle.com → Account → Create API Token. Save the downloaded `kaggle.json` to `~/.kaggle/`

**Q: Can I use this with any competition?**
A: Yes! It works with all Kaggle competitions and notebooks.

**Q: What if I don't have pyarrow installed?**
A: Run `pip install pyarrow pandas` to enable parquet reading.

See [docs/FAQ.md](docs/FAQ.md) for more questions.

## Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## License

MIT License - see [LICENSE](LICENSE) for details.

---

**Made for the [Claude Code](https://claude.ai/code) community**
