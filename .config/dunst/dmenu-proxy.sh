# Pass arguments to dmenu and capture output
DMENU_RESULT=$(dmenu $@)

# If the action selected was "view notification" switch to the app
if [ "$DMENU_RESULT" = "${DMENU_RESULT##View}" ]; then
  APP_NAME=$(echo $DMENU_RESULT | sed -E 's/[^(]*\(([^)]*).*/\1/')
  ~/.config/i3/move-to-next-window-of-type.sh $APP_NAME
fi

# Pass result to dunst
echo $DMENU_RESULT
