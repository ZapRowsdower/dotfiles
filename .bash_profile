####################################################################################################################################
# Setup aliases
####################################################################################################################################
alias ll='ls -lGFhA'
alias finderShowAll='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias finderHideAll='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

####################################################################################################################################
# SECTION: Util Functions
####################################################################################################################################
,tree () {
	find ${1:-.} | sort | sed 's|[^/]*/|-|g'
}

zen () {
	node ~/bin/pickFocusMusic.mjs
}

# Draw a line that extends the width of the terminal
drawline () {
	local lineSymbol=${1:-=}
	local line=""
	for ((i = 0 ; i < COLUMNS ; i++)); do
		line="${line}${lineSymbol}"
	done
	echo $line
}

extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

cheat() {
	curl https://cheat.sh/$1
}

####################################################################################################################################
# Bookmarks
####################################################################################################################################

bk-shellcheck () {
	open "https://www.shellcheck.net"
}

lintshell () {
	bk-shellcheck
}
