#!/bin/bash

# Pass arguments to dmenu and capture output
args=()
for a in "$@"; do
  if [[ "$a" == rgb:*/*/*/* ]]; then
    args+=("${a%/*}")
  else
    args+=("$a")
  fi
done

DMENU_RESULT="$(dmenu "${args[@]}")"

# If the action selected was "activate|view application" switch to the app
if [ "$DMENU_RESULT" = "${DMENU_RESULT##Activate}" ] || [ "$DMENU_RESULT" = "${DMENU_RESULT##View}" ]; then
  APP_NAME=$(echo $DMENU_RESULT | sed -E 's/[^(]*\(([^)]*).*/\1/')
  $HOME/.config/i3/move-to-next-window-of-type.sh $APP_NAME
fi

# Pass result to dunst
echo $DMENU_RESULT
