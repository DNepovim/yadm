ZSH_THEME="robbyrussell"

plugins=(git yarn history aliases vi-mode yarn-autocompletions brew colored-man-pages)

export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# Custom aliases
alias python=python3

alias zshconf="vim ~/.zshrc"
alias addal="vim +/aliases ~/.zshrc"

alias ll="eza -a --long --header --icons --git --no-user"

alias ylt="yarn lint"
alias yltf="yarn lint --fix"
alias ycr="yarn create"
alias yst="yarn storybook"
alias ydp="yarn dev -p"

alias bi="brew install"

alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"

alias lzg="lazygit"
alias nv="nvim ."

alias v="vercel"
alias vd="vercel dev"

alias nu="nvm use"

alias pipes="/usr/local/Cellar/pipes-sh/1.3.0/bin/pipes.sh"

eval $(thefuck --alias fuck)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/dominik/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dominik/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/dominik/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dominik/google-cloud-sdk/completion.zsh.inc'; fi
eval "$(zellij setup --generate-auto-start zsh)"
