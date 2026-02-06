# Claude Workspace Switcher

Switch between Claude Code profiles with isolated configs. Use different accounts, workspaces, and API keys without logging in and out.

## Install

```bash
brew tap swedishdeveloper/claude-workspace-switcher
brew install cw
```

Or manually:

```bash
curl -fsSL https://raw.githubusercontent.com/swedishdeveloper/claude-workspace-switcher/main/bin/cw \
  -o /usr/local/bin/cw && chmod +x /usr/local/bin/cw
```

## Quick start

```bash
# Create a profile with your Claude subscription (Pro/Max/Team)
cw add personal
cw login personal

# Create a profile with an API key from a specific Console workspace
cw add work
cw login work
# Choose "API key" and paste a key from console.anthropic.com

# Switch between profiles
cw use personal
cw use work
cw use                # interactive picker
```

## Commands

| Command | Description |
|---------|-------------|
| `cw list` | Show all profiles and their status |
| `cw add <name>` | Create a new profile |
| `cw remove <name>` | Delete a profile |
| `cw login <name>` | Authenticate a profile (Claude Code login or API key) |
| `cw use [name]` | Start Claude Code with a profile |
| `cw alias` | Print shell aliases for direct access |

## How it works

Each profile is an isolated `CLAUDE_CONFIG_DIR` under `~/.claude-profiles/`. This means separate credentials, settings, and usage limits per profile.

**OAuth profiles** (subscription) authenticate via browser — Claude Code handles the login flow.

**API key profiles** use a key you create manually at [console.anthropic.com](https://console.anthropic.com) in the specific workspace you want. The key is stored locally with `chmod 600` and passed as `ANTHROPIC_API_KEY`.

## Shell aliases

Generate aliases for even faster access:

```bash
cw alias >> ~/.zshrc
source ~/.zshrc

# Now use directly:
claude-personal
claude-work
```

## Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `CW_PROFILES_DIR` | `~/.claude-profiles` | Where profiles are stored |

## Requirements

- Bash 4+
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed

## License

MIT
