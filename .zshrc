export TERM="xterm-256color"

if [[ `uname` = "Darwin" ]]; then
  echo "Mac OS"
else
  echo "Linux"
  CONTRIBUTOR_ID=$(cat /etc/*-release | grep '^ID=' | cut -d '=' -f 2 | tr -d '"')
  case $CONTRIBUTOR_ID  in
	  amzn) 
	    echo "amazon linux yum"
	    dependencies=("fzf" "vim")
	    for dependency in ${dependencies[@]}; do  
		if ! type $dependency > /dev/null; then
		    yum install $dependency
		fi
	    done
	    ;;
	  debian) echo "debian apt" ;;
	  ubuntu) echo "ubuntu apt" ;;
	  *) echo "unknow" ;;
  esac
fi

# user can pass their own PREFIX_PATH to customize the zsh path,
# otherwise we will use shell var HOME, and assume they clone
# the repo into .zsh directory


if [[ $PREFIX_PATH = '' ]]
then
  PREFIX_PATH="$HOME/.zsh"
fi

PLUGINS="$PREFIX_PATH/plugins"
THEMES="$PREFIX_PATH/themes"
FONTS="$PREFIX_PATH/fonts"
ALIASES="$PREFIX_PATH/aliases"

# install dependicies for using zplug

#dependencies=("awk" "zsh" "fzf" "vim")

#for dependency in ${dependencies[@]}; do  
    #if ! type $dependency > /dev/null; then
        #apt install $dependency
    #fi
#done


# start initializing zplug ...
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source $HOME/.zplug/init.zsh


#alias sourcing start

source $ALIASES/zsh.sh

#alias sourcing end

# install fonts start

# if OS is OS X

nerdfonts=("Hack Regular Nerd Font Complete.ttf" "Hack Bold Nerd Font Complete.ttf" "Hack Bold Italic Nerd Font Complete.ttf" "Hack Bold Nerd Font Complete.ttf")

if [ `uname` = "Darwin" ]; then
  for nerdfont in ${nerdfonts[@]}; do
    if [ ! -f /Library/Fonts/$nerdfont ]; then
      cp $FONTS/hack_nerd/$nerdfont /Library/Fonts 
      echo "nerd fonts installed"
    fi
  done
fi


# install fonts end


#theme start

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_MODE='nerdfont-complete'

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

#theme end

#plugins start

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "zsh-users/zsh-history-substring-search", from:github, defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "djui/alias-tips", from:github
zplug "b4b4r07/enhancd", use:init.sh
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "plugins/docker", from:oh-my-zsh


#plugins end

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load 
