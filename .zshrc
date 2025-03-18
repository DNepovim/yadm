# Install zplug with: curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

export XDG_CONFIG_HOME="$HOME/.config"

export ZPLUG_HOME=~/.zplug
[[ ! -d $ZPLUG_HOME ]] && {
  echo "zplug not found. Please install it first."
  echo "Run: curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh"
  return 1
}
source $ZPLUG_HOME/init.zsh

zplug "ohmyzsh/ohmyzsh"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/yarn", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "lukechilds/zsh-nvm", defer:2
zplug "dracula/zsh", as:theme
zplug "zsh-users/zsh-autosuggestions"

setopt AUTO_CD

if ! zplug check; then
    printf "Install missing plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

alias nts="nvim ~/notes"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias zelrc="vim ~/.config/zellij/config.kdl"
alias wezrc="vim ~/.wezterm.lua"
alias nvc="nvim  ~/.config/nvim"
alias dot="yadm enter lazygit"
alias python=python3

alias doom="cd ~/terminal-doom && zig-out/bin/terminal-doom"

alias ll="eza -a --long --header --icons --git --no-user"

alias gi="git init"

alias ylt="yarn lint"
alias yltq="yarn lint --quiet"
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
alias vb="vercel build"

alias nu="nvm use"

alias p="cd ~/projects"
alias d="cd ~/Downloads"
alias a="cd ~/projects/arcos-react"

alias pipes="/usr/local/Cellar/pipes-sh/1.3.0/bin/pipes.sh"

alias bonsai="cbonsai -S"

eval $(thefuck --alias fuck)
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
