#!/bin/zsh

alias emacs="emacsclient -nw"
alias la="ls -a"
alias l="ls"
alias s="ls"
alias lh="ls -lh"
alias tac="tail -r"
#alias ls="ls --color=always" #Macではエラーになるからコメントアウト
#alias rm="rm -i"
alias w3mg="w3m http://google.co.jp"
alias calender="cal"
# alias eclipse="/usr/bin/eclipse"
alias rails="/usr/bin/rails"
#alias gcc="gcc -lm" #math.hでsqrt()を使うとき、-lmオプションをつけないとエラー
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias rails_f="cd ~/Dropbox/fluidtask;rails s"
alias ruby1.9="ruby1.9 -Ku" #utf8
alias ghc="ghc -O2"
alias texcompile="platex *.tex ; dvipdfmx *.dvi"
alias grep='grep --color=auto'
alias kakasi='kakasi -i utf-8 -o utf-8'
alias locate_updatedb='/usr/libexec/locate.updatedb'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias uniq='LC_ALL=C uniq' #なんか、これ付けないと消えることがあるらしいよ?
alias sl='ls'
alias scp_download='scp'
alias scp_upload='scp'
# alias sort='gsort'

alias scrr="screen -r"
alias scls="screen -ls"

#Python
alias python='python -t' #ソースファイルが、タブ幅に依存して意味が変わるような方法でタブ文字とスペースを混ぜて含んでいる場合に警告を発生させます。このオプションを2重にする (-tt) とエラーになります。

# git
alias gst="git status"
alias gba="git branch -vv"
#alias gba="echo -n"
alias gout="git checkout"
alias gt="git stash"
alias gtl="git stash list"
alias gts="git stash save"
alias gtp="git stash pop"

alias -g L='| lv'
alias -g H='| head'
alias -g G='| grep'
alias -g T='| tail'
alias -g W='| wc'
alias -g N='| nkf -Lu'
alias -g NL='| nkf -Lu | lv'
alias -g ....='../..'
alias -g ......='../../..'

#漢直エイリアス
alias 後="ls"
alias 改="cd"
alias 免由="echo"
alias 注='wc'
alias 協='rm'
alias 武='lv'
alias 幸='mv'
alias 応='cp'
alias 能次='ping'
alias 蹴三='omake'
alias 計議='grep'
alias 宿児='mecab'
alias 毛治='open'
alias め映='which'
alias め映』='which'
alias ふ「='tut'
alias 諸区='exit'
alias 種葉='juman'

alias open_pdf='open `ls *.pdf | head -n1`'
