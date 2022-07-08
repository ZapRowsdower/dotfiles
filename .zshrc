emulate sh
. ~/.profile
emulate zsh

# Draw a line that extends the width of the terminal
# drawline () {
# 	local lineSymbol=▫
# 	local line=""
	
# 	for i in {1..$COLUMNS}; line="$line$lineSymbol"
# 	echo $line
# }

# Load version control information
# https://stackoverflow.com/questions/30840651/what-does-autoload-do-in-zsh
autoload -Uz vcs_info

# precmd is executed before your prompt is displayed and is often used to set values in your $PROMPT
# https://github.com/rothgar/mastering-zsh/blob/master/docs/config/hooks.md#hooks
precmd() {
	drawline ∙
	vcs_info
}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT=$'${NEWLINE}${PWD/#$HOME/~} %{%B%F{yellow}%}${vcs_info_msg_0_}%{%b%f%}${NEWLINE}%B%D%t >%b '
