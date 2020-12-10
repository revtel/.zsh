export ZSH="/Users/chienli/.zsh"
export PLUGINS="/Users/chienli/.zsh/plugins"
export THEMES="/Users/chienli/.zsh/themes"

#theme start

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

POWERLEVEL9K_MODE='nerdfont-complete'

source $THEMES/powerlevel9k/powerlevel9k.zsh-theme
#theme end

