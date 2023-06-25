# ll alias
if command -sq exa
    alias ll="exa -l@ --icons"
else
    alias ll="ls -lh"
end