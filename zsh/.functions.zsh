# -------------------------------------------------------------------
# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# -------------------------------------------------------------------
# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# -------------------------------------------------------------------
# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# -------------------------------------------------------------------
# dataurl: create a data URL from a file
dataurl()
{
  local mimeType=$(file -b --mime-type "$1")

  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi

  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# -------------------------------------------------------------------
# gitio: create a git.io short URL
gitio()
{
  if [ -z "${1}" ]; then
    echo "Usage: \`gitio github-url-or-shortcut\`"
    return 1
  fi

  local url
  local code

  if [[ "$1" =~ "https:" ]]; then
    url=$1
  else
    url="https://github.com/${1}"
  fi

  code=$(curl_post -k https://git.io/create -F "url=${url}")

  echo https://git.io/${code}
}

# -------------------------------------------------------------------
# passwdgen: a password generator
#
# usage: passwdgen 8 --> e.g.: f4lwka_2f
passwdgen()
{
  if [ $1 ]; then
    local length=$1
  else
    local length=16
  fi

  tr -dc A-Za-z0-9_ < /dev/urandom  | head -c${1:-${length}}
}

# -------------------------------------------------------------------
# box: a function to create a box of '=' characters around a given string
#
# usage: box 'testing'
box()
{
  local t="$1xxxx"
  local c=${2:-"#"}

  echo ${t//?/$c}
  echo "$c $1 $c"
  echo ${t//?/$c}
}

# -------------------------------------------------------------------
# extract: extract of compressed-files
extract()
{
  if [ -f $1 ] ; then
    local lower=$(lc $1)

    case $lower in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar e $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.lha)       lha e $1        ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via >extract<"
                   return 1        ;;
    esac

  else
    echo "'$1' is not a valid file"
  fi
}

# -------------------------------------------------------------------
# file_backup_compressed: create a compressed backup (with date)
# in the current dir
#
# usage: file_backup_compressed test.txt
file_backup_compressed()
{
  if [ $1 ]; then
    if [ -z $1 ]; then
      echo "$1: not found"
      return 1
    fi

    tar czvf "./$(basename $1)-$(date +%y%m%d-%H%M%S).tar.gz" "$1"
  else
    echo "Missing argument"
    return 1
  fi
}

# -------------------------------------------------------------------
# file_backup: creating a backup of a file (with date)
file_backup()
{
  for FILE ; do
    [[ -e "$1" ]] && cp "$1" "${1}_$(date +%Y-%m-%d_%H-%M-%S)" || echo "\"$1\" not found." >&2
  done
}


# Do a Matrix movie effect of falling characters
function matrix1() {
echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|gawk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
}

function matrix2() {
echo -e "\e[1;40m" ; clear ; characters=$( jot -c 94 33 | tr -d '\n' ) ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) $characters ;sleep 0.05; done|gawk '{ letters=$5; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
}