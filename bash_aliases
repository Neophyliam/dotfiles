alias l.='ls -d .* --color=auto'
alias shutdown='sync && echo -e "Do not close the lid!\nDo not close the lid!\nDo not close the lid!" && sleep 3 && shutdown -h now'
alias reboot='sync && reboot'
alias upgrade='sudo apt-get update; sudo apt-get upgrade'
alias mux='tmuxinator'
alias emacs="env LC_CTYPE=zh_CN.UTF-8 emacs"
alias du='du -h'
alias df='df -h'
alias unittest='python3 -m unittest'
alias pyconsole='python3 -i console.py'
alias vimclean="find ~/.vim/vimbak -ctime +7 -delete"

# shadowsocks & polipo
alias proxyon="export http_proxy=127.0.0.1:8123 && export https_proxy=127.0.0.1:8123"
alias proxyoff="export http_proxy='' && export https_proxy=''"
alias proxy-chromium="chromium-browser --proxy-server=127.0.0.1:8123"

# edit CMakeLists.txt
alias cml="vim CMakeLists.txt"
