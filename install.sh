#!/bin/bash
# ============================================================
# dotfiles install.sh - devcontainer用サンプル
#
# 使い方:
#   1. このディレクトリを自分のdotfilesリポジトリにコピー
#   2. VS Code設定で Dotfiles Repository に自分のリポジトリを指定
#   3. 必要に応じてカスタマイズ
# ============================================================

set -euo pipefail

is_devcontainer() {
    [ -f /.dockerenv ] || [ -n "${REMOTE_CONTAINERS:-}" ] || [ -n "${CODESPACES:-}" ]
}

# zshを有効化した場合は SHELL_RC="$HOME/.zshrc" に変更する
SHELL_RC="$HOME/.bashrc"

# ============================================================
# Claude Code alias（devcontainer内のみ）
# ============================================================
if is_devcontainer; then
    if ! grep -qF 'alias claude="claude --dangerously-skip-permissions"' "$SHELL_RC" 2>/dev/null; then
        echo '' >> "$SHELL_RC"
        echo '# Claude Code (devcontainer only)' >> "$SHELL_RC"
        echo 'alias claude="claude --dangerously-skip-permissions"' >> "$SHELL_RC"
        echo "[dotfiles] Claude alias configured (devcontainer detected)"
    else
        echo "[dotfiles] Claude alias already configured, skipping"
    fi
fi

# ============================================================
# 以下はお好みで有効化（コメントアウトを外す）
# ============================================================

# --- zsh + Oh My Zsh ---
# sudo apt-get update -qq && sudo apt-get install -y -qq zsh
# if [ ! -d "$HOME/.oh-my-zsh" ]; then
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#     git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#     git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# fi

# --- 便利ツール ---
# sudo apt-get update -qq && sudo apt-get install -y -qq ripgrep fd-find tree tmux
