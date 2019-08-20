# Args:
function await-compile-success {
    await-file /tmp/compile-success
}

# Args: filepath
function await-file {
    echo -n "Awaiting..."
    while [ ! -f $1 ]; do
        sleep 1
    done
    echo "ready!"
}

# Args: out-dir target
function build {
    autoninja -C ~/repos/chromium/src/out/"$1" "$2"
}

# Args: out-dir target target-args...
function build-and-open {
    build "$1" "$2" && open $@
}

# Args: out-dir target gtest-filter
function build-and-open-test {
    build "$1" "$2" && open-test "$1" "$2" "$3"
}

# Args: compile-command entr-directories...
function compile-loop {
    # Infinite while loop because entr crashes if a file goes missing.
    while true; do
        # Subtract 2 for the compile status and newline.
        let HEAD_LINES=$(tput lines)-2
        find "${@:2}" | entr -r bash -c "
            shopt -s expand_aliases
            source ~/.bash_aliases
            rm -f /tmp/compile-success
            echo $(printf '%*s' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '_')
            echo Compile started: $1
            $1 | python ~/scripts/dedupe-errors.py | fold -w $(tput cols) | head -n "${HEAD_LINES}"
            if [ \${PIPESTATUS[0]} -eq 0 ]; then
                echo Compile success
                touch /tmp/compile-success
            else
                echo Compile failed
            fi;"
    done
}

# Args: out-dir target target-args...
function open {
    local ABS_OUT_DIR=~/repos/chromium/src/out/"$1"
    local TARGET="$2"
    shift 2
    "$ABS_OUT_DIR"/"$TARGET" $@
}

# Args: out-dir target gtest-filter
function open-test {
    open "$1" "$2" --gtest_filter="$3"
}
