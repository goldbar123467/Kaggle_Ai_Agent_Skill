#!/bin/bash

# Kaggle AI Agent Skill Installer
# https://github.com/goldbar123467/Kaggle_Ai_Agent_Skill

set -e

PLUGIN_NAME="kaggle-tools"
CLAUDE_DIR="$HOME/.claude"
PLUGINS_DIR="$CLAUDE_DIR/plugins"
SETTINGS_FILE="$CLAUDE_DIR/settings.json"

echo "========================================"
echo "  Kaggle AI Agent Skill Installer"
echo "========================================"
echo ""

# Check for kaggle CLI
if ! command -v kaggle &> /dev/null; then
    echo "⚠️  Warning: Kaggle CLI not found"
    echo "   Install with: pip install kaggle"
    echo "   Then add credentials to ~/.kaggle/kaggle.json"
    echo ""
fi

# Check for kaggle credentials
if [ ! -f "$HOME/.kaggle/kaggle.json" ]; then
    echo "⚠️  Warning: Kaggle credentials not found"
    echo "   Download from: kaggle.com → Account → Create API Token"
    echo "   Save to: ~/.kaggle/kaggle.json"
    echo ""
fi

# Create plugin directory
echo "📁 Creating plugin directory..."
mkdir -p "$PLUGINS_DIR/$PLUGIN_NAME/commands"

# Copy plugin files
echo "📋 Copying plugin files..."
cp -r plugin/* "$PLUGINS_DIR/$PLUGIN_NAME/"

# Update settings.json to enable plugin
echo "⚙️  Updating Claude Code settings..."

if [ -f "$SETTINGS_FILE" ]; then
    # Check if plugin already enabled
    if grep -q "\"$PLUGIN_NAME\"" "$SETTINGS_FILE"; then
        echo "   Plugin already in settings.json"
    else
        # Add plugin to enabledPlugins
        # This is a simple approach - adds before the closing brace of enabledPlugins
        if grep -q "enabledPlugins" "$SETTINGS_FILE"; then
            # Use Python for reliable JSON manipulation
            python3 << PYEOF
import json

with open("$SETTINGS_FILE", "r") as f:
    settings = json.load(f)

if "enabledPlugins" not in settings:
    settings["enabledPlugins"] = {}

settings["enabledPlugins"]["$PLUGIN_NAME"] = True

with open("$SETTINGS_FILE", "w") as f:
    json.dump(settings, f, indent=2)

print("   Added $PLUGIN_NAME to enabledPlugins")
PYEOF
        else
            echo "   Warning: Could not find enabledPlugins in settings.json"
            echo "   You may need to manually add: \"$PLUGIN_NAME\": true"
        fi
    fi
else
    echo "   Creating new settings.json..."
    cat > "$SETTINGS_FILE" << 'JSONEOF'
{
  "enabledPlugins": {
    "kaggle-tools": true
  }
}
JSONEOF
fi

echo ""
echo "========================================"
echo "  ✅ Installation Complete!"
echo "========================================"
echo ""
echo "Next steps:"
echo "  1. Restart Claude Code"
echo "  2. Type /kaggle to get started"
echo ""
echo "Quick test:"
echo "  /kaggle list"
echo ""
echo "Need help? See: docs/FAQ.md"
echo ""
