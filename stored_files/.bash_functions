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
    local OUT_DIR="$1"
    local TARGET="$2"
    shift 2
    autoninja -C ~/repos/chromium/src/out/"$OUT_DIR" "$TARGET"
}

# Args: out-dir target target-args...
function build-and-open {
    local OUT_DIR="$1"
    local TARGET="$2"
    shift 2
    build "$OUT_DIR" "$TARGET" && open "$OUT_DIR" "$TARGET" $@
}

# Args: out-dir target gtest-filter
function build-and-open-test {
    local OUT_DIR="$1"
    local TARGET="$2"
    local GTEST_FILTER="$3"
    shift 3
    build "$OUT_DIR" "$TARGET" && open-test "$OUT_DIR" "$TARGET" "$GTEST_FILTER" $@
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
    local OUT_DIR="$1"
    local TARGET="$2"
    shift 2
    ~/repos/chromium/src/out/"$OUT_DIR"/"$TARGET" $@
}

# Args: out-dir target gtest-filter target-args...
function open-test {
    local OUT_DIR="$1"
    local TARGET="$2"
    local GTEST_FILTER="$3"
    shift 3
    open "$OUT_DIR" "$TARGET" --gtest_filter="$GTEST_FILTER" $@
}
