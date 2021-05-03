# Add ~/bin to path
if test -d $HOME/bin
    fish_add_path $HOME/bin
end

# ll alias
if command -sq exa
    alias ll="exa -l@ --icons"
else
    alias ll="ls -l"
end

# fancy prompt!
starship init fish | source

