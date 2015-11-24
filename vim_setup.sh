#!/bin/sh

# As of now, $THIS_DIR (the path to the directory in which this file exists)
# *MUST* be ~/dotfiles. So, $THIS_DIR does not make much sense here. 
#THIS_DIR=`dirname $0`
THIS_DIR=~/dotfiles
ln -sf ${THIS_DIR}/.bashrc ~/.bashrc
ln -sf ${THIS_DIR}/_vimrc ~/.vimrc
ln -sf ${THIS_DIR}/_gvimrc ~/.gvimrc
ln -sfT ${THIS_DIR}/.vim ~/.vim

# Set up for NeoBundle
NB_DIR=${THIS_DIR}/.vim/bundle/neobundle.vim
if [ -z "`ls -A ${NB_DIR}`" ]; then
    # NB_DIR is empty, that is, the submodule has not been initialized yet. 
    CURRENT_DIR=`pwd`
    cd ${NB_DIR}
    git submodule init
    git submodule update
    cd ${CURRENT_DIR}

#    vim -s ${THIS_DIR}/command.dat
#    vim -e -s < ${THIS_DIR}/command.dat
    vim -e -c "NeoBundleInstall" -c "q"
    # FIXME どうやったら以下の $? が 0 を返すようになる？
    echo 'the result of "vim -e -c" ' $?
fi

# Set up for Neosnippet 
# 最初にvimを起動してNeoBundleInstallを実行しないとエラー
SNIP_DIR=${THIS_DIR}/.vim/neosnippets
NEOSNIPPET_DIR=${THIS_DIR}/.vim/bundle/neosnippet-snippets/neosnippets
for snip in `ls $SNIP_DIR`; do
    if [ "_${snip##*.}" = "_snip" ]; then
#        rm ${NEOSNIPPET_DIR}/${snip}
#        ln -sf ${SNIP_DIR}/${snip} ${NEOSNIPPET_DIR}/${snip}
        cp -f ${SNIP_DIR}/${snip} ${NEOSNIPPET_DIR}/${snip}
    fi
done

# Set up for Quickrun
cp -f ${THIS_DIR}/.vim/vim-quickrun/autoload/quickrun.vim ${THIS_DIR}/.vim/bundle/vim-quickrun/autoload/quickrun.vim
