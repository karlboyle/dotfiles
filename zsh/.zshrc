# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Speeds up load time
DISABLE_UPDATE_PROMPT=true

# Spaceship Prompt Config
SPACESHIP_PROMPT_ADD_NEWLINE='true'
SPACESHIP_CHAR_SYMBOL='➜'
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_CHAR_COLOR_SUCCESS='yellow'
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW='true'
SPACESHIP_USER_SHOW='true'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="spaceship"
DEFAULT_USER=$USER
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  docker 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  jira
  brew
  osx
)
source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Load the shell dotfiles
for file in $HOME/.{aliases.zsh,functions.zsh,paths.zsh,scripts.zsh}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# If Work Machine
[ -f ~/.work.zsh ] && source ~/.work.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# brew install thefuck
eval $(thefuck --alias)