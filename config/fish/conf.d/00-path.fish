# rust/cargo
if test -d ~/.cargo/bin
    fish_add_path ~/.cargo/bin
end

# add ~/.local/bin
if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end
