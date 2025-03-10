ZSH_THEME="robbyrussell"

plugins=(git yarn history aliases vi-mode brew colored-man-pages nvm)

export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh


# Custom aliases
alias nts="nvim ~/notes"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias zelrc="vim ~/.config/zellij/config.kdl"
alias nvc="nvim  ~/.config/nvim"
alias python=python3

alias doom="cd ~/terminal-doom && zig-out/bin/terminal-doom"


alias ll="eza -a --long --header --icons --git --no-user"

alias gi="git init"

alias ylt="yarn lint"
alias yltf="yarn lint --fix"
alias ycr="yarn create"
alias yst="yarn storybook"
alias ydp="yarn dev -p"

alias bic="brew install --cask"

alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"

alias lzg="lazygit"
alias nv="nvim ."
alias nvc="nvim ~/.config/nvim"

alias v="vercel"
alias vd="vercel dev"
alias vd="vercel build"

alias nu="nvm use"

alias pipes="/usr/local/Cellar/pipes-sh/1.3.0/bin/pipes.sh"

alias bonsai="cbonsai -S"

eval $(thefuck --alias fuck)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

