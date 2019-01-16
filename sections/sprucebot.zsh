#
# Sprucebot
#
# Link: https://spruce.ai

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SPRUCEBOT_SHOW="${SPACESHIP_SPRUCEBOT_SHOW=true}"
SPACESHIP_SPRUCEBOT_COLOR="${SPACESHIP_SPRUCEBOT_COLOR="green"}"
SPACESHIP_SPRUCEBOT_PREFIX="${SPACESHIP_SPRUCEBOT_PREFIX=""}"
SPACESHIP_SPRUCEBOT_SUFFIX="${SPACESHIP_SPRUCEBOT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SPRUCEBOT_SYMBOL="${SPACESHIP_SPRUCEBOT_SYMBOL="🌲🤖 "}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_sprucebot() {
  [[ $SPACESHIP_SPRUCEBOT_SHOW == false ]] && return

  # Show sprucebot status only for JS-specific folders
  [[ -f package.json || -d node_modules || -n *.js(#qN^/) ]] || return

  local 'skill_kit_version'

  skill_kit_version=$(node -p "require('./package.json')['sprucebot-skills-kit-version']" 2> /dev/null)

  [[ -z $skill_kit_version || "$skill_kit_version" == "null" || "$skill_kit_version" == "undefined" ]] && return

  spaceship::section \
    "$SPACESHIP_SPRUCEBOT_COLOR" \
    "$SPACESHIP_SPRUCEBOT_PREFIX" \
    "${SPACESHIP_SPRUCEBOT_SYMBOL}v${skill_kit_version}" \
    "$SPACESHIP_SPRUCEBOT_SUFFIX"
}
