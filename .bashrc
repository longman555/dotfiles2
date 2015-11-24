# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# my additional config
# 実行ファイル
export PATH=~/local/bin:~/local/jdk1.8.0_40/bin:$PATH

# インクルードファイル
export C_INCLUDE_PATH=~/Dropbox/src/include:$C_INCLUDE_PATH
#export CPLUS_INCLUDE_PATH=~/local/include/c++/4.9.2/:~/local/include/c++/4.9.2/x86_64-unknown-linux-gnu/:$CPLUS_INCLUDE_PATH

# ライブラリ
export LIBRARY_PATH=~/local/lib64/:~/local/libexec/gcc/x86_64-unknown-linux-gnu/4.9.2/:~/local/lib:~/Dropbox/src/lib:$LIBRARY_PATH
# LD_LIBRARY_PATHが定義されていないと、clang/clang++実行時に
# libstdc++.so.6のバージョン問題でエラーが発生する
export LD_LIBRARY_PATH=~/local/lib64:~/local/libexec/gcc/x86_64-unknown-linux-gnu/4.9.2:~/local/lib:~/Dropbox/src/lib:$LD_LIBRARY_PATH
#export LD_RUN_PATH=~/local/lib64:~/local/libexec/gcc/x86_64-unknown-linux-gnu/4.9.2:~/local/lib:~/Dropbox/src/lib:$LD_RUN_PATH
# LD_RUN_PATHのテスト
export LD_RUN_PATH=~/Dropbox/src/lib:$LD_RUN_PATH

# 必要が無くなったら消す？
export CC=~/local/bin/gcc
export CXX=~/local/bin/g++

# Google Test用設定
export CPLUS_INCLUDE_PATH=~/local/lib/gtest/gtest-1.7.0/include:$CPLUS_INCLUDE_PATH
export LIBRARY_PATH=~/local/lib/gtest/gtest-1.7.0/lib:$LIBRARY_PATH

# Java用設定
export JAVA_HOME=~/local/jdk1.8.0_40

# Tomcat用設定
export CATALINA_HOME=/usr/share/tomcat7

# サーブレット関係コードのコンパイルに必要なjarファイル
export CLASSPATH=$CLASSPATH:/usr/share/java/jsp-api-2.2.jar:/usr/share/java/servlet-api-3.0.jar

# Gradle用設定
export GRADLE_HOME=~/local/gradle/gradle
export PATH=$GRADLE_HOME/bin:$PATH

# end of .bashrc
echo '.bashrc loaded'
