# Look in the ./bin directory for any binaries
# so you don't have to write ./bin/drupal, etc
export PATH="$PATH:./bin"

# https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
source ~/dotfiles/git-completion.bash


# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you donât want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

#colours
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#ssh-agent
SSH_ENV=$HOME/.ssh/environment
function start_agent {
     echo "Initializing new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     echo succeeded
     chmod 600 ${SSH_ENV}
     /usr/bin/ssh-add;
}
# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -x | grep "^ *${SSH_AGENT_PID}" | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

#Source RVM
source /Users/reuben/.rvm/scripts/rvm

# Dev Desktop
# export PATH="/Applications/DevDesktop/mysql/bin:$PATH"
#export DEVDESKTOP_DRUPAL_SETTINGS_DIR="$HOME/.acquia/DevDesktop/DrupalSettings"


# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

function blt() {
  if [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
    GIT_ROOT=$(git rev-parse --show-cdup)
  else
    GIT_ROOT="."
  fi

  if [ -f "$GIT_ROOT/vendor/bin/blt" ]; then
    $GIT_ROOT/vendor/bin/blt "$@"
  else
    echo "You must run this command from within a BLT-generated project repository."
    exit 1
  fi
}

