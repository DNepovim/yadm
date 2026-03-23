function dot
    if test (count $argv) -eq 0
        lazygit -w $HOME -g $HOME/.dotfiles
    else
        git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv
    end
end
