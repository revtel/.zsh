# user can pass their own PREFIX_PATH to customize the zsh path,
# otherwise we will use shell var HOME, and assume they clone
# the repo into .zsh directory
if [[ $PREFIX_PATH = '' ]]
then
  PREFIX_PATH="$HOME/.zsh"
fi

export PLUGINS="$PREFIX_PATH/plugins"
export THEMES="$PREFIX_PATH/themes"

#theme start

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)

POWERLEVEL9K_MODE='nerdfont-complete'

source $THEMES/powerlevel9k/powerlevel9k.zsh-theme

#theme end

#plugins start

source $PLUGINS/tig

#plugins end
