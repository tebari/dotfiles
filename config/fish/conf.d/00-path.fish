# rust/cargo
if test -d ~/.cargo/bin
    fish_add_path ~/.cargo/bin
end

# local node
if test -d ~/.npm-packages/bin
    fish_add_path ~/.npm-packages/bin
end

# add ~/.local/bin
if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end
