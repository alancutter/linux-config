# Args: compile-command entr-directories...
function compile-loop {
    # Infinite while loop because entr crashes if a file goes missing.
    while true; do
        find "${@:2}" | entr -r bash -c "
            shopt -s expand_aliases
            source ~/.bash_aliases
            rm -f /tmp/compile-success
            echo $(printf '%*s' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '_')
            echo Compile started
            $1 | dde | head -n $(tput lines)
            if [ \${PIPESTATUS[0]} -eq 0 ]; then
                echo Compile success
                touch /tmp/compile-success
            else
                echo Compile failed
            fi;"
    done
}

function await-file {
    echo -n "Awaiting..."
    while [ ! -f $1 ]; do
        sleep 1
    done
    echo "ready!"
}

function await-compile-success {
    await-file /tmp/compile-success
}
