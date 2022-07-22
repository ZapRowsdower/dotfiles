if [ -f "$HOME/dotfiles-private/bash/.bash_profile" ]; then
	. "$HOME/dotfiles-private/bash/.bash_profile"
fi

PS1='\n\[\e[0;2m\]\s \[\e[0m\]\w \[\e[0;1;93m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\n\[\e[0;2m\]\@ \[\e[0m\]\$\[\e[0m\]> \[\e[0m\]'

####################################################################################################################################
# SECTION: Setup aliases
####################################################################################################################################
if [[ "$OSTYPE" == "darwin"* ]]; then
	# Mac OSX
	alias finderShowAll='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
	alias finderHideAll='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
	alias cdcloud='cd "${HOME}/Library/Mobile Documents/com~apple~CloudDocs"'
fi

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

alias ll='ls -lGFhA'
# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Easier navigation: .., ...
alias ..="cd .."
alias ...="cd ../.."

# Show disk usage of specified files/dirs in human readable format
alias dush="du -sh"

alias psgrep="ps aux | grep"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

####################################################################################################################################
# SECTION: Util Functions
####################################################################################################################################
# Mac OSX only
if [[ "$OSTYPE" == "darwin"* ]]; then
	# Change directory to the current Finder directory
	cdf() {
		target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
		if [ "$target" != "" ]; then
				cd "$target"; pwd
		else
				echo 'No Finder window found' >&2
		fi
	}

	# Open Google Drive directory
	gdrive() {
		# Launch app
		open "/Applications/Google Drive.app/Contents/MacOS/Google Drive" & 
		cd "/Volumes/GoogleDrive/My Drive/"
	}

	# Display macOS notification with:
	# $1 - title of notification
	# $2 - provided notification message text
	util-notify () {
		osascript -e "display notification \"${2}\" with title \"${1}\""
	}

fi

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

# Binary cheat sheet: https://cheat.sh/
cheat() {
	curl "https://cheat.sh/$1"
}

# Get current time since UNIX epoch in milliseconds
# https://serverfault.com/a/423642
tsms() {
	python -c 'import time; print(int(time.time() * 1000))'
}

# TL;DR for BEM CSS naming conventions cuz I can't keep it in my head 
bem() {
	clear
	echo "
--------------------------
██████  ███████ ███    ███
██   ██ ██      ████  ████
██████  █████   ██ ████ ██
██   ██ ██      ██  ██  ██
██████  ███████ ██      ██
--------------------------
"
	echo "$(tput setaf 2).block$(tput sgr0)$(tput setaf 3)__element$(tput sgr0)$(tput setaf 4)--modifier$(tput sgr0)"
	echo ""
	echo "$(tput setaf 2).breadcrumb$(tput sgr0)$(tput setaf 3)__item$(tput sgr0)$(tput setaf 4)--bold$(tput sgr0)"
	echo ""
	echo "--------------------------"
	echo ""
	echo "$(tput setaf 2)- BLOCK$(tput sgr0) is any DOM node that accepts a class name:"
	echo "		$(tput setaf 2)<div class=\"block\">...</div>$(tput sgr0)"
	echo ""
	echo "$(tput setaf 3)- ELEMENT$(tput sgr0) is any DOM node within a block:"
	echo "
		<div class=\"block\">
			...
			$(tput setaf 3)<span class=\"block__elem\"></span>$(tput sgr0)
		</div>"
	echo ""
	echo "$(tput setaf 4)- MODIFIER$(tput sgr0) is an extra class name which you add to a block/element DOM node. Add modifier classes only to blocks/elements they modify, and keep the original class:"
	echo "
		<div class=\"block $(tput setaf 4)block--mod$(tput sgr0)\">...</div>
			<div class=\"block $(tput setaf 4)block--size-big block--shadow-yes$(tput sgr0)\">...</div>
	"
	echo ""
	echo "More info: $(tput setaf 6)$(tput smul)http://getbem.com/naming/$(tput sgr0)"
	echo ""
}

####################################################################################################################################
# SECTION: Bookmarks
####################################################################################################################################
bk-shellcheck () {
	open "https://www.shellcheck.net"
}
