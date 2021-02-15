function darwin(){
  if  ! type "brew" > /dev/null ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  dependencies=("vim" "python")
  for dependency in ${dependencies[@]}; do
      if ! type $dependency > /dev/null; then
	  brew install $dependency
      fi
  done
  export FZF_DEFAULT_COMMAND='fd --type f'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

function amzn(){
  dependencies=("vim" "python")
  for dependency in ${dependencies[@]}; do
    if ! type $dependency > /dev/null; then
      yum -y install $dependency
    fi
  done
}

function ubuntu(){
  dependencies=("vim" "python" "universal-ctags" "python3" "python3-pip" "curl" "silversearcher-ag" "fd-find")
  for dependency in ${dependencies[@]}; do
    if ! type $dependency > /dev/null; then
      apt -y install $dependency
    fi
  done
  cd ~ && git clone https://github.com/junegunn/fzf.git && fzf/install
  pip3 install pynvim
  export FZF_DEFAULT_COMMAND='fdfind --type f'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

if [[ `uname` = "Darwin" ]]; then
  darwin
else
  DISTRIBUTION_ID=$(cat /etc/*-release | grep '^ID=' | cut -d '=' -f 2 | tr -d '"')
  case $DISTRIBUTION_ID  in
	  amzn)
      amzn
	    ;;
	  ubuntu)
      ubuntu
	    ;;
	  *) echo "unknow" ;;
  esac
fi

# user can pass their own PREFIX_PATH to customize the zsh path,
# otherwise we will use shell var HOME, and assume they clone
# the repo into .zsh directory


if [[ $PREFIX_PATH = '' ]]; then
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
source $ALIASES/git.sh

#alias sourcing end


#plugins start

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "zsh-users/zsh-history-substring-search", from:github, defer:2
zplug "djui/alias-tips", from:github
zplug "zsh-users/zsh-autosuggestions"
zplug 'dracula/zsh', as:theme

#plugins end


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
