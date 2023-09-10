# ll alias
if command -sq eza
    alias ll="eza -l --icons --git"
else if command -sq exa
    alias ll="exa -l --icons"
else
    alias ll="ls -lh"
end
