# Args: entr-directory compile-command
function compile-loop {
    HORIZONTAL_LINE=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '_')
    while true; do
        find $1 | entr bash -ci "echo ${HORIZONTAL_LINE}; $2 | dde | head -n $(tput lines); if [ \${PIPESTATUS[0]} -eq 0 ]; then echo Compile success; else echo Compile failed; fi"
    done
}
