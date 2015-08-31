. ~/zsh/zshrc_basic.sh
. ~/zsh/zshrc_alias.sh

#octave
# export GNUTERM=x11

#原形に戻して分かち書き
alias mecab_wakati_normal_form='mecab -F"%f[6] " -U"%m " -E"\n"'

#scala
alias scala="scala -classpath . "
JAVA_TOOL_OPTIONS='-Dfile.encoding=UTF8'

#Macbook Pro
export SCALA_HOME=~/local/src/scala-2.10.3/
export PATH=$SCALA_HOME/bin:$PATH

# export LSCOLORS=exfxcxdxbxegedabagacad
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=4\
# 6;30:tw=42;30:ow=43;30'

# alias ls="ls --color"
# zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' '\
# cd=43;34'

#SSReflect
export COQBIN=$HOME/local/bin
export PATH=$COQBIN:$PATH

#CFML
# export CFML=$HOME/local/src/cfml
# export PATH=$CFML:$PATH

#Fink
# source /sw/bin/init.sh

#alias coqide="open -a /Applications/CoqIdE_8.4pl2.app/"

#OPAM
# eval `opam config env`

#Python
export PYTHONPATH=/Users/sak/local/src/liblinear-1.94/python:$PYTHONPATH
export PYTHONPATH=/Users/sak/local/src/libsvm/python:$PYTHONPATH
export PYTHONPATH=/Users/sak/local/lib/python/:$PYTHONPATH

#TUT-Code
#例: $ searchTUTchar "あ" => ((("r" "k"))("あ" "ア"))
function searchTUTchar(){
  if [ $1 = "0" ]; then
    echo  '((("0"))("0"))'
    return 0
  fi
  if [ $1 = "1" ]; then
    echo  '((("1"))("1"))'
    return 0
  fi
  if [ $1 = "1" ]; then
    echo  '((("1"))("1"))'
    return 0
  fi
  if [ $1 = "2" ]; then
    echo  '((("2"))("2"))'
    return 0
  fi
  if [ $1 = "3" ]; then
    echo  '((("3"))("3"))'
    return 0
  fi
  if [ $1 = "4" ]; then
    echo  '((("4"))("4"))'
    return 0
  fi
  if [ $1 = "5" ]; then
    echo  '((("5"))("5"))'
    return 0
  fi
  if [ $1 = "6" ]; then
    echo  '((("6"))("6"))'
    return 0
  fi
  if [ $1 = "7" ]; then
    echo  '((("7"))("7"))'
    return 0
  fi
  if [ $1 = "8" ]; then
    echo  '((("8"))("8"))'
    return 0
  fi
  if [ $1 = "9" ]; then
    echo  '((("9"))("9"))'
    return 0
  fi
  if [ $1 = "." ]; then
    echo '((("#"))("#"))'
    return 0
  fi
  result=`nkf -w /Library/Frameworks/UIM.framework/Versions/Current/share/uim/tutcode-rule.scm | LC_ALL=C grep "))(\"$1\"" | head -n1`
if test -z $result; then
 echo '((("#"))("#"))'
else
    echo $result
fi


}

#キーストロークから漢字をヒットさせる
# function tutSim(){

# }


function searchTUT(){
  str=`echo $1 | tr -d '\n'`
  for i in {1..${#str}}; do
    searchTUTchar `echo $str | cut -c$i` | tee -a ~/.tutsearch_history
  done
}

function tutLoop(){
  while read str; do
    str=`echo $str | tr -d '\n'`
    #空行を入力しても無視
    if test -z $str; then
      continue
    fi
    #exitと入力するとそこで終了
    if test $str = "exit"; then
      break
    fi
    searchTUT $str
  done
}

#標準入力の文字をkeyに変えて出力
function kanji2key(){
  while read str; do
    #空行は無視
    input=`echo $str | tr -d '\n'`
    if test -z $input; then
      continue
    fi

    searchTUT $input
  done | grep -o "^[ ]*((([^)]*))" | tr '\n' '@' | sed -e 's/@/"@"/g' | grep -o "\"[0-9A-Za-z,./; @#]\"" | tr -d '"'
}

alias serachTUT='searchTUT'
alias tut='searchTUT'
alias tutServer='tutLoop'

#ocamlfind
export PATH=/Users/sak/local/src/findlib-1.5.3/package-macosx/root/Users/sak/local/bin:$PATH

#JAVA
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.7"`
alias java1.6="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Commands/java"
export PATH=$JAVA_HOME/bin:$PATH

export LD_LIBRARY_PATH=/Users/sak/local/lib/:$LD_LIBRARY_PATH

#cabochaのインストール
export LD_LIBRARY_PATH=$HOME/local/include:$LD_LIBRARY_PATH
export CPLUS_INCLUDE_PATH=$HOME/local/include/:$CPLUS_INCLUDE_PATH

#TUT-Code
function practice_tut(){
  if test -z $1; then
    arg=10
  else
    arg=$1
  fi

  ~/tutcode_practice/script/tutcode_practice.sh ~/.tutsearch_history $arg
}

#ディレクトリを作成してそこに移動
#オプション(-pなど)の利用は不可
function mkdirc(){
  mkdir $1
  cd $1
}


##gitのブランチを表示する
#http://kitak.hatenablog.jp/entry/2013/05/25/103059
# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示,そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"$RPROMPT


#PHP
# export PATH='/usr/local/php5/bin':$PATH

sakura=www1109.sakura.ne.jp


alias chrome='open "/Applications/Google Chrome.app" --args --renderer-process-limit=1'

#先頭に配置
#つまり、自分でインストールしたコマンドを優先する
export PATH=$HOME/local/bin:$PATH

#pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi
