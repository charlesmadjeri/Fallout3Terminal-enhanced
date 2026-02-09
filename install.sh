#!/usr/bin/env bash
# Fallout3Terminal install script
# Run from the Fallout3Terminal directory: ./install.sh

set -e

BASE_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$BASE_DIR"

echo "Fallout3Terminal setup"
echo "====================="

# Check dependencies
MISSING=()
command -v pv &>/dev/null    || MISSING+=(pv)
command -v play &>/dev/null  || MISSING+=(sox)
command -v cool-retro-term &>/dev/null || MISSING+=(cool-retro-term)

if [[ ${#MISSING[@]} -gt 0 ]]; then
    echo "Missing required tools: ${MISSING[*]}"
    echo "Install with:"
    echo "  Ubuntu/Debian: sudo apt install pv sox cool-retro-term"
    echo "  macOS:         brew install pv sox && brew install --cask cool-retro-term"
    exit 1
fi
echo "Dependencies OK (pv, sox, cool-retro-term)"

# Create entries directory
mkdir -p "$BASE_DIR/entries"
echo "Entries directory ready"

# Create .env from example if missing
if [[ ! -f "$BASE_DIR/.env" ]]; then
    cp "$BASE_DIR/.env.example" "$BASE_DIR/.env"
    echo "Created .env from .env.example"
    read -p "Enter terminal name for greeter (default: Proto-Boy): " name
    name="${name:-Proto-Boy}"
    # Sanitize: strip quotes, newlines, trim spaces; fallback to default if empty
    name="$(echo "$name" | tr -d '\n\r' | sed 's/["'\'']//g' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
    [[ -z "$name" ]] && name="Proto-Boy"
    grep -v "^TERMINAL_NAME=" "$BASE_DIR/.env" > "$BASE_DIR/.env.tmp"
    echo "TERMINAL_NAME=\"$name\"" >> "$BASE_DIR/.env.tmp"
    mv "$BASE_DIR/.env.tmp" "$BASE_DIR/.env"
else
    echo ".env already exists (not overwritten)"
fi

# Make script executable
chmod +x "$BASE_DIR/terminalscript"
echo "terminalscript is executable"

echo ""
echo "Done. Run with:"
echo "  cool-retro-term --fullscreen --noclose -e bash $BASE_DIR/terminalscript"
echo ""
