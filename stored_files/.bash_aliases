alias acs="await-compile-success"
alias awfd="adb wait-for-device"
alias b="build"
alias barkbarkbark="echo Bark bark bark\!"
alias bcos="build chromeos"
alias bcosbt="bcos browser_tests"
alias bcosc="bcos chrome"
alias bcosut="bcos unit_tests"
alias bl="build lacros"
alias blbt="bl browser_tests"
alias blc="bl chrome"
alias bo="build-and-open"
alias bocos="bo chromeos"
alias bocosbt="bocos browser_tests"
alias bocosc="bocos chrome"
alias bocosut="bocos unit_tests"
alias bol="bo lacros"
alias bor="bo release"
alias borbt="bor browser_tests"
alias borc="bor chrome"
alias borut="bor unit_tests"
alias bot="build-and-open-test"
alias botcos="bot chromeos"
alias botcosbt="botcos browser_tests"
alias botcosut="botcos unit_tests"
alias botl="bot lacros"
alias botlbt="botl browser_tests"
alias botlut="botl unit_tests"
alias botr="bot release"
alias botrbt="botr browser_tests"
alias botrut="botr unit_tests"
alias br="build release"
alias brbt="br browser_tests"
alias brc="br chrome"
alias brut="br unit_tests"
alias calc="python -c \"import sys;print(eval(sys.argv[1].replace('x', raw_input())))\""
alias cb="xclip -selection clipboard"
alias cbo="xclip -selection clipboard -o"
alias cdh="cd ~"
alias cdr="cd ~/repos"
alias cdrb="cd ~/repos/blink"
alias cdrc2="cd /mnt/ssd/repos/chromium2/src"
alias cdrc="cd /mnt/ssd/repos/chromium/src"
alias cdrcos="cd /mnt/ssd/repos/chromiumos/src"
alias cdri="cd ~/repos/infra-public/infra"
alias cdrt="cd ~/repos/todo"
alias cdrwad="cd ~/repos/web-animations-demos"
alias cdrwajs="cd ~/repos/web-animations-js"
alias cdrwan="cd ~/repos/web-animations-next"
alias cl="compile-loop"
alias dde="python3 ~/scripts/dedupe-errors.py"
alias eba="\$EDITOR ~/.bash_aliases"
alias ebf="\$EDITOR ~/.bash_functions"
alias ebrc="\$EDITOR ~/.bashrc"
alias ee="echo \$EDITOR"
alias ees="export EDITOR=\"subl -w\""
alias eev="export EDITOR=\"vim\""
alias egc="\$EDITOR ~/.gitconfig"
alias egcon="\$EDITOR \$(git conflicts)"
alias egs="goma_ctl ensure_start"
alias egstop="goma_ctl ensure_stop"
alias epbrc="\$EDITOR ~/.private_bashrc"
alias evrc="\$EDITOR ~/.vimrc"
alias fn="find -name"
alias fp="find | grep --color=auto"
alias func="declare -f"
alias funcs="declare -F"
alias g="git"
alias gcb="google-chrome-beta"
alias gcbt="google-chrome-beta \"\$TESTURL\""
alias gcs="google-chrome-stable"
alias gcst="google-chrome-stable \"\$TESTURL\""
alias gcu="google-chrome-unstable"
alias gcut="google-chrome-unstable \"\$TESTURL\""
alias gdbc="gdb --args ~/repos/chromium/src/out/debug/chrome --single-process \"\$TESTURL\""
alias gdbcos="gdb --args ~/repos/chromium/src/out/chromeos_debug/chrome"
alias gdbcs="gdb --args ~/repos/chromium/src/out/debug/content_shell --single-process --enable-experimental-web-platform-features \"\$TESTURL\""
alias gdbutb="gdb --args ~/repos/chromium/src/out/debug/webkit_unit_tests --gtest_filter='*Animation*'"
alias gnrat="gn refs --all -tree"
alias horn="mpv ~/horn.mp3"
alias hs="httpserver"
alias kbj="kill -9 \$(jobs -p)"
alias l1="ls -1F"
alias l="ls"
alias lahl="ls -ahlF"
alias lal="ls -alF"
alias laol="ls -aolF"
alias lhs="python3 -m http.server"
alias ll="ls -lF"
alias loal="ls -oalF"
alias lol="ls -olF"
alias lvm="cros chrome-sdk --download-vm --log-level=info --internal --board=betty"
alias lx="less -X"
alias nj="autoninja -C"
alias o="open"
alias ocos="o chromeos"
alias ocosc="ocos chrome"
alias or="o release"
alias orbt="or browser_tests"
alias orc="or chrome"
alias orut="or unit_tests"
alias ot="open-test"
alias otcos="ot chromeos"
alias otcosbt="otcos browser_tests"
alias otr="ot release"
alias otrbt="otr browser_tests"
alias otrut="otr unit_tests"
alias sba=". ~/.bash_aliases"
alias sbf=". ~/.bash_functions"
alias sbrc=". ~/.bashrc"
alias sgb="git diff @{upstream} --name-only | xargs subl"
alias sgc="git conflicts | xargs subl"
alias showpath="echo \$PATH | sed 's/:/\\n/g'"
alias spbrc=". ~/.private_bashrc"
alias t="tree -L 2"
alias tb="python ~/repos/chromium/src/third_party/blink/tools/run_web_tests.py --fully-parallel --disable-breakpad --target release --num-retries=0"
alias tba="tb animations"
alias xsrc="~/.xsessionrc"
