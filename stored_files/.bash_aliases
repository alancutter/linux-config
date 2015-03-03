alias ..2="cd ../.."
alias ..="cd .."
alias agb="archive-git-branches"
alias awfd="adb wait-for-device"
alias ba="ninja -C ~/repos/clank/src/out/Release content_shell_apk"
alias bada="ba && da"
alias bb="ninja -C ~/repos/chromium/src/out/Debug blink_tests" # Build Blink
alias bbr="ninja -C ~/repos/chromium/src/out/Release blink_tests" # 
alias bbut="ninja -C ~/repos/chromium/src/out/Debug webkit_unit_tests" # Build Blink unit tests
alias bbutr="ninja -C ~/repos/chromium/src/out/Release webkit_unit_tests" # Build Blink unit tests release
alias bc="ninja -C ~/repos/chromium/src/out/Debug chrome" # Build Chromium
alias bcoc="bc && oc"
alias bcr="ninja -C ~/repos/chromium/src/out/Release chrome" # Build Chromium release
alias bcrocr="bcr && ocr"
alias cb="xclip -selection clipboard"
alias cbb="cc && ubb" # Clean & build Blink
alias cbbr="ccr && ubbr" # Clean & build Blink release
alias cbc="cc && ubc" # Clean & build Chromium
alias cbcr="ccr && ubcr" # Clean & build Chromium release
alias cbo="xclip -selection clipboard -o"
alias cc="echo \"Will delete the out/Debug directory. Press ^C within 3 seconds to cancel.\" && sleep 3 && echo \"Deleting out/Debug.\" && rm -rf ~/repos/chromium/src/out/Debug"
alias ccr="echo \"Will delete the out/Release directory. Press ^C within 3 seconds to cancel.\" && sleep 3 && echo \"Deleting out/Release.\" && rm -rf ~/repos/chromium/src/out/Release"
alias cdh="cd ~"
alias cdr="cd ~/repos"
alias cdrb="cd ~/repos/blink"
alias cdrc="cd ~/repos/chromium/src"
alias cdri="cd ~/repos/infra-public/infra"
alias cdrwad="cd ~/repos/web-animations-demos"
alias cdrwajs="cd ~/repos/web-animations-js"
alias cdrwan="cd ~/repos/web-animations-next"
alias da="~/repos/clank/src/build/android/adb_install_apk.py --apk ContentShell.apk --release"
alias ding="pacmd play-file /usr/share/sounds/freedesktop/stereo/complete.oga 1 > /dev/null"
alias eba="\$EDITOR ~/.bash_aliases"
alias ebrc="\$EDITOR ~/.bashrc"
alias ee="echo \$EDITOR"
alias ees="export EDITOR=\"subl -w\""
alias eev="export EDITOR=\"vim\""
alias egc="\$EDITOR ~/.gitconfig"
alias evrc="\$EDITOR ~/.vimrc"
alias fn="find -name"
alias fp="find | grep --color=auto"
alias func="declare -f"
alias funcs="declare -F"
alias g="git"
alias gcb="git b | grep \\\*"
alias gcessh="gcutil --project=google.com:webkit ssh"
alias gdbc="gdb --args ~/repos/chromium/src/out/Debug/chrome --single-process file://`echo ~/tests/test.html`" # Debug Chromium
alias gdbcs="gdb --args ~/repos/chromium/src/out/Debug/content_shell --single-process file://`echo ~/tests/test.html`" # Debug content_shell
alias gdbutb="gdb ~/repos/chromium/src/out/Debug/webkit_unit_tests --args --gtest_filter='*Animation*'" # Debug Blink unit tests
alias gg="git gpc"
alias l1="ls -1F"
alias lahl="ls -ahlF"
alias lal="ls -alF"
alias laol="ls -aolF"
alias ll="ls -lF"
alias loal="ls -oalF"
alias lol="ls -olF"
alias o="xdg-open"
alias oc="~/repos/chromium/src/out/Debug/chrome --no-sandbox file://`echo ~/tests/test.html`" # Open Chromium
alias ocr="~/repos/chromium/src/out/Release/chrome file://`echo ~/tests/test.html`" # Open Chromium release
alias ocrsp="~/repos/chromium/src/out/Release/chrome --single-process file://`echo ~/tests/test.html`" # Open Chromium release
alias ocs="~/repos/chromium/src/out/Debug/content_shell --no-sandbox --enable-experimental-web-platform-features file://`echo ~/tests/test.html`" # Open content_shell debug
alias ocsp="~/repos/chromium/src/out/Debug/chrome --no-sandbox --single-process file://`echo ~/tests/test.html`" # Open Chromium
alias ocsr="~/repos/chromium/src/out/Release/content_shell --enable-experimental-web-platform-features file://`echo ~/tests/test.html`" # Open content_shell release
alias olh="o http://localhost:8000"
alias orc="git st | grep 'both modified' | cut -d' ' -f8 | xargs \$EDITOR" # Open git rebase conflicts
alias pshs="echo http://localhost:8000 && python -m SimpleHTTPServer"
alias ptb="cd ~/repos/chromium/src && ./tools/perf/run_measurement blink_perf third_party/WebKit/PerformanceTests --browser=content-shell-debug && cd -" # Perf test Blink
alias ptba="cd ~/repos/chromium/src && ./tools/perf/run_measurement blink_perf third_party/WebKit/PerformanceTests/Animation --browser=content-shell-debug && cd -" # Perf test Blink Web Animations
alias ptbr="cd ~/repos/chromium/src && ./tools/perf/run_measurement blink_perf third_party/WebKit/PerformanceTests --browser=content-shell-release && cd -" # Perf test Blink release
alias ptbra="cd ~/repos/chromium/src && ./tools/perf/run_measurement blink_perf third_party/WebKit/PerformanceTests/Animation --browser=content-shell-release && cd -" # Perf test Blink release Web Animations
alias rmr="rm -r"
alias showdir="nautilus \$(pwd)"
alias showpath="echo \$PATH | sed 's/:/\\n/g'"
alias sm="slowmouse"
alias spd="show-pretty-diff"
alias sublw="subl -w"
alias t="tree -L 2"
alias tb="run-webkit-tests --disable-breakpad --debug --no-new-test-results --no-retry-failures" # Test Blink
alias tbr="run-webkit-tests --disable-breakpad --release --no-new-test-results --no-retry-failures" # Test Blink release
alias tbrwt="run-webkit-tests --disable-breakpad --release --no-retry-failures" # Test Blink release and write missing expectations
alias tbwt="run-webkit-tests --disable-breakpad --debug --no-retry-failures" # Test Blink and write missing expectations
alias ua="~/repos/clank/src/build/gyp_chromium"
alias uba="ua && ba"
alias ubada="ua && ba && da"
alias sba=". ~/.bash_aliases"
alias ubb="uc && bb" # Update Chromium & build Blink
alias ubbr="uc && bbr" # Update Chromium & build Blink release
alias ubbut="uc && bbut" # Update Chromium & build Blink unit tests
alias ubbutr="uc && bbutr" # Update Chromium & build Blink unit tests release
alias ubc="uc && bc" # Update Chromium & build Chromium
alias ubcr="uc && bcr" # Update Chromium & build Chromium release
alias ubrc=". ~/.bashrc"
alias uc="~/repos/chromium/src/build/gyp_chromium" # Update Chromium
alias utb="~/repos/chromium/src/out/Debug/webkit_unit_tests" # Unit test Blink
alias utbr="~/repos/chromium/src/out/Release/webkit_unit_tests" # Unit test Blink release
alias xrtb="xvfb-run run-webkit-tests --disable-breakpad --debug --no-show-results"
alias xrtbr="xvfb-run run-webkit-tests --disable-breakpad --release --no-show-results"