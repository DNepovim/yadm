if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ll="eza --oneline --long --icons=always --hyperlink --all --group-directories-first"

alias b="brew"
alias bi="brew install"

alias fc="vim .config/fish/config.fish"

starship init fish | source
eval "$(/opt/homebrew/bin/brew shellenv)"
