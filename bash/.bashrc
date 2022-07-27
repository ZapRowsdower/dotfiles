# .bashrc gets executed every time a user starts up a fresh terminal session in interactive mode
 
if [ -f "$HOME/.bash_profile" ]; then
   . "$HOME/.bash_profile"
fi

if [ -f "$HOME/dotfiles-private/bash/.bashrc" ]; then
   . "$HOME/dotfiles-private/bash/.bashrc"
fi
