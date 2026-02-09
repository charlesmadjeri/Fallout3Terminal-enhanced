#!/usr/bin/env bash
# Run Fallout3Terminal inside cool-retro-term (fullscreen, no close button)
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
exec cool-retro-term --fullscreen --noclose -e bash "$SCRIPT_DIR/terminalscript"
