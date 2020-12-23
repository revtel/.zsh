export TERM="xterm-256color"
export LANG=en_US.UTF-8

if [[ `uname` = "Darwin" ]]; then
  if  ! type "brew" > /dev/null ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  dependencies=("vim" "python")

  for dependency in ${dependencies[@]}; do  
      if ! type $dependency > /dev/null; then
	  brew install $dependency
      fi
  done
else
  CONTRIBUTOR_ID=$(cat /etc/*-release | grep '^ID=' | cut -d '=' -f 2 | tr -d '"')
  case $CONTRIBUTION_ID  in
	  amzn) 
	    dependencies=("vim" "python")
	    for dependency in ${dependencies[@]}; do  
		if ! type $dependency > /dev/null; then
		    yum -y install $dependency
		fi
	    done
	    ;;
	  debian | ubuntu)
	    dependencies=("vim" "python")
	    for dependency in ${dependencies[@]}; do  
		if ! type $dependency > /dev/null; then
		    apt -y install $dependency
		fi
	    done
	    ;;
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


# start initializing zplug ...
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source $HOME/.zplug/init.zsh


#alias sourcing start

source $ALIASES/zsh.sh

#alias sourcing end


#plugins start

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "zsh-users/zsh-history-substring-search", from:github, defer:2
zplug "djui/alias-tips", from:github
zplug "zsh-users/zsh-autosuggestions"
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "plugins/docker", from:oh-my-zsh
zplug 'dracula/zsh', as:theme


#plugins end

zplug clean

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load 
