#!/usr/bin/env fish

set DOTFILES_ROOT (pwd -P)

function info
	echo [(set_color --bold) ' .. ' (set_color normal)] $argv
end

function debug
	if test -n "$DEBUG"
		echo [(set_color --bold blue) ' DB ' (set_color normal)] $argv
	end
end

function success
	echo [(set_color --bold green) ' OK ' (set_color normal)] $argv
end

function warning
	echo [(set_color --bold yellow) WARN (set_color normal)] $argv
end

function isDryRun
	if test -n "$DRYRUN"
		return 0
	else
		return 1
	end
end

function run
	if isDryRun
		debug DRY $argv
	else
		debug $argv
		command $argv
	end
end

function createBackup
	set linkPath $argv[1]
	set backupSuffix ".backup"
	if test -e $linkPath
		set backupPath $linkPath$backupSuffix
		info "Backing up $linkPath to $backupPath"
		if test -e $backupPath
			warning "$backupPath already exists, aborting install of $linkPath"
			return 1
		end

		run mv $linkPath $backupPath
	end
end

function runls
	set sourcePath $argv[1]
	set linkPath $argv[2]

	# Create symlink using relative paths
	if test -n "$DOTFILE_FORCE"
		# with --force
		run ln -sr --force $sourcePath $linkPath
	else
		run ln -sr $sourcePath $linkPath
	end
	success "Created symlink $sourcePath -> $linkPath"
end

function createLink
	echo $argv | read -l sourcePath linkPath
	if not test -e $sourcePath
		warning "$sourcePath does not exist"
		return 1
	end

	if test -L $linkPath
		if test -n "$DOTFILE_FORCE"
			warning "DOTFILE_FORCE enabled replacing existing symlink"
			runls $sourcePath $linkPath
			return 0
		end

		info "$linkPath is already a symlink, skipping"
		return 0
	end

	if createBackup $linkPath
		runls $sourcePath $linkPath
	end
end

function createLinksInDirectory
	echo $argv | read -l sourceDir linkTargetDir
	
	debug "Linking configs $sourceDir -> $linkTargetDir"
	if not test -e $sourceDir
		warning "$sourceDir does not exists, skipping linking"
		return
	end

	for file in (ls -A $sourceDir)
		createLink $sourceDir/$file $linkTargetDir/$file
	end
end

function linkXDGConfigs
	set dotConfigPath $DOTFILES_ROOT/config

	if set -q XDG_CONFIG_HOME and test -n (echo $XDG_CONFIG_HOME)
		set configHome $XDG_CONFIG_HOME
	else
		set configHome $HOME/.config
	end

	createLinksInDirectory $dotConfigPath $configHome
end


if isDryRun
	info Dry run enabled
end

info "Bootstrapping..."

# Symlinks
createLinksInDirectory "$DOTFILES_ROOT/home" $HOME
linkXDGConfigs

success "Done!"