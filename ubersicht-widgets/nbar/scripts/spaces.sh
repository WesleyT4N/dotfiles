#!/bin/sh

PATH=/usr/local/bin/:$PATH

# Check if yabai exists
if ! [ -x "$(command -v yabai)" ]; then
  echo "{\"error\":\"yabai binary not found\"}"
  exit 1
fi

SPACES=$(yabai -m query --spaces --display)
ACTIVE_SPACE=$(yabai -m query --spaces --space)

echo $(cat <<-EOF
{
  "spaces": $SPACES,
  "active_space": $ACTIVE_SPACE
}
EOF
)
