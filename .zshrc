export DOTFILES=~/.dotfiles

source $DOTFILES/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle brew
antigen bundle sudo
antigen bundle bower
antigen bundle npm
antigen bundle grunt

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

antigen apply
