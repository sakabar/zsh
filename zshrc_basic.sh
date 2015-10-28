#!/bin/zsh
autoload -Uz compinit && compinit

## 重複パスを登録しない
typeset -U path cdpath fpath manpath


export LANG=ja_JP.UTF-8
export MANPATH=/opt/local/man:$MANPATH
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export PATH=$HOME/Library/TeXShop/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH
export JUNIT_HOME=/usr/local/java/junit3.8.2
export CLASSPATH=$HOME:$JUNIT_HOME/junit.jar:$CLASSPATH
export CLASSPATH=.:$CLASSPATH

#PROMPT="%/%%" #デフォ
PROMPT="**/%2/%(?||[%SNG%s])%%"
PROMPT2="%_%%"
SPROMPT="%r is correct?[n,y,a,e]:"
RPROMPT=""
RPROMPT="[%T]"$RPROMPT
RPROMPT=""$RPROMPT

setopt typeset_silent #コマンドを実行した時に右プロンプトを消す

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
SHELL=/bin/zsh

a=`echo $ZSH_VERSION`
b=`zsh --version | awk '{print $2}'`
if [ $a = $b ]; then
else
  echo "Version is different!"
  #この2つの変数の値が異なっていると不具合が起こりうるらしいので、一応チェック。
fi

#setopt hist_ignore_dups
setopt share_history
setopt inc_append_history #複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt extended_history # zsh の開始・終了時刻をヒストリファイルに書き込む

alias history_all="history 1"

bindkey -e
export EDITOR=emacs

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_no_store
setopt nohist_reduce_blanks #ヒストリがバグって記録される原因かもしれないので、明示的にオフにしておく

DIRSTACKSIZE=100
setopt auto_pushd
setopt auto_cd
zstyle ':completion:*' menu select
#今いるディレクトリを補完候補から外す
#…はずなんだけど、今はなぜかうまく動いていない。
zstyle ':completion:*:cd:*' ignore-parents parent pwd ../
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

setopt correct
setopt list_packed
setopt nolistbeep
setopt noautoremoveslash

#ファイル名生成の拡張
#これをONにするとgitのHEAD^がglob扱いになって使えなくなるのでオフ
# setopt extended_glob

#リダイレクトによる上書き防止
#正直めんどいのでコメントアウト。痛い目見ないと分からないんじゃない?
#setopt noclobber

#ctrl-Dでログアウトしないようにする
#setopt IGNORE_EOF

#先読み補完
# autoload predict-on
# predict-on


#移動した後は'ls'する
# function chpwd() { ls -F }

#\'^'を押すと上のディレクトリに移動する
# function cdup() {
# echo
# cd ..
# zle reset-prompt
# }
# zle -N cdup
# bindkey '\^' cdup

#コマンド実行に3秒以上かかったときtimeコマンドと同じようにしてくれる
#REPORTTIME=3
