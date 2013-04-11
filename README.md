# CHH's dotfile

    cd
    git clone --recursive git@github.com:chinghanho/.dotfiles.git
    cd .dotfiles
    rake install

after all, need to compile command-t for Vim:

    cd .dotfiles/.vim/bundle/command-t/ruby/command-t
    rvm use 1.8.7
    ruby extconf.rb
    make
