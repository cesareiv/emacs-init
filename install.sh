#! /usr/bin/env sh
if [ -f ~/.emacs.d/init.el ]
then
    echo "Backing up ~/.emacs.d/init.el to ~/.emacs.d/init.el.bak"
    mv ~/.emacs.d/init.el ~/.emacs.d/init.el.bak
fi

echo "Installing new init.el into ~/.emacs.d/init.el"
cp init.el ~/.emacs.d/init.el
