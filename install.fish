#!/usr/bin/env fish

set -l dotfile_config_folder $PWD/(dirname (status --current-filename))/config/fish
set -l config_folder $HOME/.config/fish

if test -d $config_folder
    mv $config_folder {$config_folder}_bk
end

ln -s $dotfile_config_folder $config_folder