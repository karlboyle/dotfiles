#!/bin/zsh

dotfiles="$HOME/workspace/dotfiles"
if [[ -d "$dotfiles" ]]; then
  echo "Symlinking dotfiles from $dotfiles"
else
  echo "$dotfiles does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

# Symbolic Links
for location in $(find $dotfiles/* -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  link "$location" "$HOME/$file"
done