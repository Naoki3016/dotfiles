export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
eval "$(anyenv init -)"
setopt +o nomatch

eval "$(starship init zsh)"