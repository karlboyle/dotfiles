
# Homebrew
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

# My IP
alias myip="ipconfig getifaddr en0"

# Directory listings
# LS_COLORS='no=01;37:fi=01;37:di=07;96:ln=01;36:pi=01;32:so=01;35:do=01;35:bd=01;33:cd=01;33:ex=01;31:mi=00;05;37:or=00;05;37:'
# -G Add colors to ls
# -l Long format
# -h Short size suffixes (B, K, M, G, P)
# -p Postpend slash to folders
alias ls='ls -G -h -p '
alias ll='ls -l -G -h -p '

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation

alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# add ssh-key to ssh-agent when key exist
if [ "$SSH_AUTH_SOCK" != "" ] && [ -f ~/.ssh/id_rsa ] && [ -x /usr/bin/ssh-add  ]; then
  ssh-add -l >/dev/null || alias ssh='(ssh-add -l >/dev/null || ssh-add) && unalias ssh; ssh'
fi

# reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# mkdir: always create parent-dirs, if needed
alias mkdir="mkdir -p"
alias md="mkdir"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"
# Undo a `git commit`
alias undocommit="git reset --soft 'HEAD^'"

# Show/hide all desktop icons (useful when presenting)
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"