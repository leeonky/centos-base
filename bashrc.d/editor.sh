export EDITOR=vim
alias e="if ps -ef | grep $EDITOR | grep -v grep | grep -wq \$(ps -o ppid= -p \$\$); then exit; elif [ -f ./project.vim ]; then ./project.vim; else $EDITOR; fi"
