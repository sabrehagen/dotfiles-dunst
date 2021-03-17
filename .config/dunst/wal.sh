# Stop dunst
pkill -f dunst

# Start dunst
tmux new-session \
  -d \
  -s dunst \
  dunst -print \
  2>/dev/null
