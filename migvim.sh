cwd=$(pwd)
cd ~
if [ -d ".vim" ]; then
    echo "Directory .vim exists"
else
    mkdir .vim
    cd .vim
    mkdir vimbak
    cd "$cwd"
    cp vimrc ~/.vimrc
    cp mysnips ~/.vim/
fi
