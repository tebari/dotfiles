# Automatically activate/deactivate Python virtual environments
# when entering/leaving directories with .venv folders

function __auto_venv --on-variable PWD
    # Check if we're already in a virtual environment
    set -l current_venv $VIRTUAL_ENV

    # Look for .venv in current directory and parent directories
    set -l venv_path ""
    set -l check_dir $PWD

    while test $check_dir != "/"
        if test -d "$check_dir/.venv"
            set venv_path "$check_dir/.venv"
            break
        end
        set check_dir (dirname $check_dir)
    end

    # If we found a venv and it's different from the current one
    if test -n "$venv_path"
        set -l activate_script "$venv_path/bin/activate.fish"

        if test -f "$activate_script"
            # Only activate if it's a different venv or no venv is active
            if test "$current_venv" != "$venv_path"
                # Deactivate current venv if one is active
                if test -n "$current_venv"
                    deactivate
                end
                source "$activate_script"
            end
        end
    else
        # No venv found, deactivate if one is currently active
        if test -n "$current_venv"
            deactivate
        end
    end
end

# Run once on shell startup
__auto_venv
