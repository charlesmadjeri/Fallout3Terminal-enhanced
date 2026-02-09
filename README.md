# Fallout3Terminal

Fallout3Terminal is a Fallout 3/4/NV-inspired Terminal operating system, complete with the ability to write personal logs, and in-game sounds from Fallout 3 itself! The interface uses lore-accurate RobCo Unified Operating System styling, including a POST-like boot sequence, terse all-caps terminal prompts, and authentic sound effects.

This is a bash script that runs inside [cool-retro-term](https://github.com/Swordfish90/cool-retro-term), a retro CRT terminal emulator, for the full Fallout experience.

# Features

* **View Personal Logs** - Browse and read saved log entries
* **Record Personal Log** - Create new log entries (with lore-style timestamp)
* **Edit Personal Log** - Open the log in an editor (same feel as create: arrows, Enter = new line). Uses LOG_EDITOR or vim/vi/nano when unset
* **Delete Personal Log** - Remove log entries with Y/N confirmation
* **Terminate Session** - Exit the terminal (also available by typing `exit`)
* **Set Terminal/Inquire** - Drop into a real shell session (also triggered by pressing Enter)
* **Skippable boot sequence** - Press Enter during the POST animation to jump straight to the main menu
* **Lore-accurate UI** - POST-style boot (`RBIOS v95.2`, `64K RAM SYSTEM`, `HOLOTAPE READER PRESENT`), all-caps prompts, and authentic Fallout 3 sound effects
* **Configurable** - Typewriter speed, sound on/off, skip boot via `.env`

# Requirements

You must have the following:

* Linux based or MacOS operating system
* The following packages installed:
    * pv
    * cool-retro-term
    * sox

This has not been tested on Windows or *BSD operating systems.

Thanks to GitHub user iFloris, there are now instructions to run this on MacOS! Read on below.

# Configuration

Copy the example config file and edit it, or use the install script (see below):

```bash
cp .env.example .env
nano .env
```

| Variable | Description | Default |
|----------|-------------|---------|
| `TERMINAL_NAME` | Name shown in the greeter header | `Proto-Boy` |
| `TYPEWRITE_SPEED` | Typewriter effect speed (chars/sec) | `80` |
| `SKIP_BOOT` | Set to `true` to skip boot animation | `false` |
| `SOUND_ENABLED` | Set to `false` to disable sound effects | `true` |
| `LOG_EDITOR` | Editor for "Edit Personal Log". Empty = use vim, vi, or nano for same navigation as create log | *(empty)* |

# Install script

From the project directory, run:

```bash
chmod +x install.sh
./install.sh
```

This checks for dependencies (pv, sox, cool-retro-term), creates `.env` from `.env.example` if missing, prompts for your terminal name, creates the `entries/` directory, and makes `terminalscript` executable.

# Font Setup (Recommended)

For the authentic Fallout terminal look, install the **Monofonto** font (a recreation of the Fallout terminal typeface):

1. Download Monofonto from [dafont.com](https://www.dafont.com/monofonto.font)
2. Copy the `.otf` file to `~/.local/share/fonts/` and run `fc-cache -f`
3. In cool-retro-term: right-click -> Settings -> Terminal tab
4. Set **Rasterization** to **Default** (required to see system fonts)
5. Select **System: Monofonto** from the font dropdown

A cool-retro-term profile is included in `Fallout.json` with recommended CRT settings (green phosphor, screen curvature, Monofonto font). To use it: right-click -> Settings -> Load Profile -> select `Fallout.json`.

# Download and run Fallout3Terminal in Linux

To run this script clone this repository, make "terminalscript" an executable , and run `cool-retro-term` as follows:

```bash
git clone https://github.com/fohtla/Fallout3Terminal
chmod +x $HOME/Fallout3Terminal/terminalscript
cool-retro-term --fullscreen --noclose -e bash $HOME/Fallout3Terminal/terminalscript
```

You can also enter that command in your startup manager, as well as make launcher with it!

# Download and Run Fallout3Terminal on MacOS

 ( Instructions provided by user iFloris! )

* Have homebrew installed
   * Run the following:
```
brew install sox pv
brew cask install cool-retro-term
git clone https://github.com/fohtla/Fallout3Terminal
/Applications/cool-retro-term.app/Contents/MacOS/cool-retro-term --fullscreen --noclose -e bash $HOME/Fallout3Terminal/terminalscript
```

# Hidden Commands

These commands are not shown in the menu but work at the `#?` prompt:

| Input | Action |
|-------|--------|
| `exit` | Terminates the session (same as option 5) |
| Enter (empty) | Drops into a shell session (same as option 6) |

# Additional notes

Thank you for your interest in this! This was just a little side project that I made while sick at home, but a lot of people wanted a download!

A CRT preset is included as `Fallout.json` — import it into cool-retro-term for the recommended look. Feel free to tweak it or create your own. You might want to try a New Vegas amber look by changing the font color to `#ff8100`!

Believe it or not, I don't actually do a lot of this kind of thing, and I instead do a lot of Digital Art! I'm still learning, but you can check me out on [@fohtla_arts](http://instagram.com/fohtla_arts) on instagram. Otherwise, enjoy this little program I made for funsies!
