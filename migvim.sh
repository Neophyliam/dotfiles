cd ~
if [ -d ".vim" ]; then
    echo "Directory .vim exists"
else
    mkdir .vim
    cd .vim
    mkdir vimbak bundle mysnips
    cd bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Please copy .vimrc to your home directory. Remember to delete backuprc augroup block."
fi
