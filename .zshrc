USER_NAME=chienli # plz replace the USER_NAME

export ZSH="/Users/$USER_NAME/.zsh"
export PLUGINS="/Users/$USER_NAME/.zsh/plugins"
export THEMES="/Users/$USER_NAME/.zsh/themes"

#theme start

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

POWERLEVEL9K_MODE='nerdfont-complete'

source $THEMES/powerlevel9k/powerlevel9k.zsh-theme

#theme end

