# load up homebrew
if command -sq /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
else if command -sq /home/linuxbrew/.linuxbrew/bin/brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end
