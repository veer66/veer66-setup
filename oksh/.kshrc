export PS1='$(basename "$PWD") $ '
set -o emacs

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# pkg
export PATH="$HOME/pkg:$PATH"
export PATH="$HOME/.local/bin:$PATH"

. "$HOME/.cargo/env"
