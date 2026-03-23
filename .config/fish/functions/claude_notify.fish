#!/opt/homebrew/bin/fish

# Check if we are inside a tmux session
if set -q TMUX
    # Get the current session name using tmux display-message
    set session_name (tmux display-message -p '#S')
else
    set session_name Unknown
end

# Send the native macOS notification
osascript -e "display notification \"Claude needs your attention in session: $session_name\" with title \"Claude Code Alert\""
