#! /usr/bin/env sh

# backup an isiting init.el
if [ -f ~/.emacs.d/init.el ]
then
    echo "Backing up ~/.emacs.d/init.el to ~/.emacs.d/init.el.bak"
    mv ~/.emacs.d/init.el ~/.emacs.d/init.el.bak
fi

echo "Installing new init.el into ~/.emacs.d/init.el"
cp init.el ~/.emacs.d/init.el

# check if he custom.el file needs to be installed
if [ ! -f ~/.emacs.d/custom-lisp/custom.el ]
then
    echo "Installing custom.el into ~/.emacs.d/custom-lisp/custom.el"
    cp custom-lisp/custom.el ~/.emacs.d/custom-lisp/custom.el
fi
