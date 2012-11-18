# encoding: UTF-8
require "rake"

desc "install dot files to $HOME directory"
task :install do
  install_oh_my_zsh

  files = Dir['.*'] - %w[. .. .DS_Store .git .oh-my-zsh]
  files << ".oh-my-zsh/custom/chh.zsh-theme"

  files.each do |file|
    target = "#{ENV["HOME"]}/#{file}"
    if File.exists?(target)
      puts "found #{target}"
      puts "backing up these files under .dotfiles_backup/ directory"
      system %Q{mkdir -p #{ENV["HOME"]}/.dotfiles_backup; mv #{ENV["HOME"]}/#{file} #{ENV["HOME"]}/.dotfiles_backup/#{file}}
      link_file(file)
    else
      link_file(file)
    end
  end
end

def link_file(file)
  if file =~ /\//
    puts "making ~/#{File.dirname(file)} folder..."
    system %Q{mkdir -p "$HOME/#{File.dirname(file)}"}
    puts "copying ~/#{file}..."
    system %Q{cp "#{ENV["PWD"]}/#{file}" "#{ENV["HOME"]}/#{file}"}
  else
    puts "setting up symbol to ~/#{file}..."
    system %Q{ln -s "$PWD/#{file}" "$HOME/#{file}"}
  end
end

def install_oh_my_zsh
  oh_my_zsh = "#{ENV["HOME"]}/.oh-my-zsh"

  if File.exists?(oh_my_zsh)
    puts "found .oh_my_zsh"
  else
    puts "installing oh-my-zsh..."
    system %Q{curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh}
  end
end
