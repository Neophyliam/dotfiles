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
