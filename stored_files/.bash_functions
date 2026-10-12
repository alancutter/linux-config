# Args: command argument-1 argument-2
function flip {
    local COMMAND="$1"
    local ARGUMENT_1="$2"
    local ARGUMENT_2="$3"
    shift 3
    $COMMAND $ARGUMENT_2 $ARGUMENT_1 $@
}

# Args: grep-target
function adb-logcat-grep {
    local GREP_TARGET="$1"
    shift 1
    echo "adb logcat $GREP_TARGET:"
    adb logcat | grep --only-matching --line-buffered "$GREP_TARGET.*" | grep --color=always "$GREP_TARGET"
}

# Args: source onto
function jrb {
    local SOURCE="$1"
    local ONTO="$2"
    shift 2
    jj rebase --source "$SOURCE" --onto "$ONTO" $@
}

# Args: out-dir target
function build {
    local OUT_DIR="$1"
    local TARGET="$2"
    shift 2
    nj /mnt/ssd/repos/chromium/src/out/"$OUT_DIR" "$TARGET" $@
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

# Args: out-dir target target-args...
function open {
    local OUT_DIR="$1"
    local TARGET="$2"
    shift 2
    /mnt/ssd/repos/chromium/src/out/"$OUT_DIR"/"$TARGET" $@
}

# Args: out-dir target gtest-filter target-args...
function open-test {
    local OUT_DIR="$1"
    local TARGET="$2"
    local GTEST_FILTER="$3"
    shift 3
    open "$OUT_DIR" "$TARGET" --gtest_filter="$GTEST_FILTER" $@
}
