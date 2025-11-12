export XDG_CONFIG_HOME="$HOME/.config"

# NVM initialization for Fish shell
set -gx NVM_DIR "$HOME/.nvm"

fish_vi_key_bindings
set -gx PNPM_HOME "/Users/dominik/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
if status is-interactive
    # TODO: this is a little bit slow
    nvm use default > /dev/null 2>&1
end

# Turn off fish greeting message
set -g fish_greeting ""

# ALIASES

abbr --add ll eza --oneline --long --icons=always --hyperlink --all --group-directories-first
abbr --add llr ll -T --level=1

## BREW
abbr --add bi brew install
abbr --add bl brew list
abbr --add bo brew outdated
abbr --add bic brew install --cask
abbr --add blc brew list --cask
abbr --add bcl brew cleanup
abbr --add bu brew update
abbr --add bup brew upgrade
abbr --add buz brew uninstall --zap

## DOCKER
abbr --add dcd docker compose down
abbr --add dcu docker compose up

## GIT
abbr --add g git
abbr --add gf git fetch --prune
abbr --add gfa git fetch --prune --all
abbr --add gc git commit -m
abbr --add gs git status
abbr --add gcl git clone
abbr --add ga git add
abbr --add gaa git add --all
abbr --add gapa git add --patch
abbr --add gau git add --update
abbr --add gav git add --verbose
abbr --add gr git rebase
abbr --add gri git rebase -i
abbr --add grc git rebase --continue
abbr --add gp git push
abbr --add gpf git push --force-with-lease
abbr --add gl git log
abbr --add grl git reflog

## FISH
abbr --add f fish
abbr --add frc vim ~/.config/fish/config.fish

## FISHER
abbr --add fr fisher
abbr --add fri fisher install
abbr --add frl fisher list

## NPM
abbr --add n npm
abbr --add ni npm install
abbr --add nd npm run dev
abbr --add nb npm run build
abbr --add nt npm run test

## NVM
abbr --add nvl nvm ls
abbr --add nvlr nvm ls-remote
abbr --add nvu nvm use
abbr --add nvd nvm use default
abbr --add nvi nvm install

## YARN
abbr --add y yarn
abbr --add ya yarn add
abbr --add yad yarn add --dev
abbr --add yb yarn build
abbr --add ycc yarn cache clean
abbr --add yd yarn dev
abbr --add yi yarn init
abbr --add yln yarn lint
abbr --add ylnf yarn lint --fix
abbr --add yrm yarn remove
abbr --add yt yarn test
abbr --add ytc yarn test --coverage
abbr --add yui yarn upgrade-interactive
abbr --add yup yarn upgrade
abbr --add yw yarn workspace
abbr --add yws yarn workspaces
abbr --add yy yarn why
abbr --add yga yarn global add

## PNPM
abbr --add p pnpm
abbr --add pa pnpm add
abbr --add pad pnpm add --save-dev
abbr --add pap pnpm add --save-peer
abbr --add prm pnpm remove
abbr --add pi pnpm install
abbr --add pu pnpm update
abbr --add pui pnpm update --interactive
abbr --add puil pnpm update --interactive --latest
abbr --add pga pnpm add --global
abbr --add pgls pnpm list --global
abbr --add pgrm pnpm remove --global
abbr --add pgu pnpm update --global
abbr --add pd pnpm run dev
abbr --add pb pnpm run build
abbr --add pr pnpm run 
abbr --add ps pnpm start
abbr --add pt pnpm test
abbr --add pc pnpm check
abbr --add pfw pnpm run format:write
abbr --add ptc pnpm test --coverage
abbr --add pln pnpm run lint
abbr --add plnc pnpm run lint:check
abbr --add plnf pnpm run lint:fix
abbr --add ptc pnpm run type-check
abbr --add psp pnpm store prune
abbr --add pfw pnpm run format:write


abbr --add lzg lazygit
abbr --add dot lazygit -w ~ -g ~/.local/share/yadm/repo.git
abbr --add lzd lazydocker

abbr --add nv nvim .
abbr --add nvc nvim ~/.config/nvim

abbr --add mkd mkdir

abbr --add pr cd ~/projects
abbr --add c cd ~/.config
abbr --add v cd ~/projects/phasis-kai-frontend
abbr --add pfe cd ~/projects/fe-monorepo
abbr --add pfl cd ~/projects/full-stack-template-v1
abbr --add h cd ~

abbr --add rc cd ~/.config

abbr --add ... cd ../..
abbr --add .... cd ../../..

abbr --add wzrc vim ~/.wezterm.lua
abbr --add wz wezterm
abbr --add wzc wezterm cli
abbr --add nts nvim ~/projects/my-notes

function rmrf
    # Check if an argument is provided
    if test -z "$argv"
        return 1
    end

    set -l target "$argv[1]"

    # Check if the target exists
    if not test -e "$target"
        return 1
    end

    # Security check to prevent deleting root or current directory
    if test "$target" = "." -o "$target" = "/"
        return 1
    end

    # Calculate total items for the progress bar
    # du -a counts all files and directories recursively. wc -l counts lines.
    set -l total_items (du -a "$target" | wc -l)

    # Check if there are items to delete
    if test "$total_items" -eq 0
        return 0
    end

    # Execute the rm command, pipe its verbose output through pv,
    # and redirect pv's own output to /dev/null to avoid duplicate progress bars.
    rm -rv "$target" | pv -l -s $total_items > /dev/null
end

abbr --add ca cursor-agent
abbr --add car cursor-agent resume

thefuck --alias | source

starship init fish | source

bind ctrl-l accept-autosuggestion

fish_add_path $HOME/.local/bin
fish_add_path /Applications/WezTerm.app/Contents/MacOS
