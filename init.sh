#!/bin/bash

echo ""
if [ -f ~/.vimrc ]; then
    echo "Backing up ~/.vimrc ..."
    if [ -f ~/.vim/vimrc.bak ]; then
        echo "File ~/.vim/vimrc.bak already exists. Overwrite? [y/n]"
        while true; do
          read -n 1 -s result
          case $result in
            [Yy]* ) cp ~/.vimrc ~/.vim/vimrc.bak
                    echo "File ~/.vimrc backed up as ~/.vim/vimrc.bak"
                    break;;
            [Nn]* ) break;;
          esac
        done
      else
        cp ~/.vimrc ~/.vim/vimrc.bak
        echo "File ~/.vimrc backed up as ~/.vim/vimrc.bak"
    fi
fi
echo ""
sleep 1s

if [ -f ~/.gvimrc ]; then
    echo "Backing up ~/.gvimrc ..."
    if [ -f ~/.vim/gvimrc.bak ]; then
        echo "File ~/.vim/gvimrc.bak already exists. Overwrite? [y/n]"
        while true; do
          read -n 1 -s result
          case $result in
            [Yy]* ) cp ~/.gvimrc ~/.vim/gvimrc.bak
                    echo "File ~/.gvimrc backed up as ~/.vim/gvimrc.bak"
                    break;;
            [Nn]* ) break;;
          esac
        done
      else
        cp ~/.gvimrc ~/.vim/gvimrc.bak
        echo "File ~/.gvimrc backed up as ~/.vim/gvimrc.bak"
    fi
fi
echo ""
sleep 1s

echo "Deleting old ~/.vimrc and ~/.gvimrc ..."
rm ~/.vimrc
rm ~/.gvimrc
echo ""
sleep 1s

echo "Symlinking new ~/.vimrc and ~/.gvimrc ..."
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
echo ""
sleep 1s

echo "Creating global swap, undo, and backup directories ..."
if [ ! -d ~/.vim/.swp ]; then
    mkdir ~/.vim/.swp
fi

if [ ! -d ~/.vim/.undo ]; then
    mkdir ~/.vim/.undo
fi

if [ ! -d ~/.vim/.backup ]; then
    mkdir ~/.vim/.backup
fi
echo ""
sleep 1s

echo "All done!"
