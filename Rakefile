# encoding: UTF-8
require "rake"

desc "安裝 dot files 到根目錄下"
task :install do
  install_oh_my_zsh

  files = Dir['.*'] - %w[. .. .DS_Store .git .oh-my-zsh]
  files << ".oh-my-zsh/custom/chh.zsh-theme"

  files.each do |file|
    target = "#{ENV["HOME"]}/#{file}"
    if File.exists?(target)
      puts "發現已經存在 #{target}，正在將檔案備份到 .dotfiles_backup 目錄下"
      system %Q{mkdir -p #{ENV["HOME"]}/.dotfiles_backup; mv #{ENV["HOME"]}/#{file} #{ENV["HOME"]}/.dotfiles_backup/#{file}}
      link_file(file)
    else
      link_file(file)
    end
  end
end

def link_file(file)
  if file =~ /\//
    puts "正在建立 ~/#{File.dirname(file)} 資料夾"
    system %Q{mkdir -p "$HOME/#{File.dirname(file)}"}
    puts "正在複製 ~/#{file}"
    system %Q{cp "#{ENV["PWD"]}/#{file}" "#{ENV["HOME"]}/#{file}"}
  else
    puts "正在建立 symbol 連結到 ~/#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/#{file}"}
  end
end

def install_oh_my_zsh
  oh_my_zsh = "#{ENV["HOME"]}/.oh-my-zsh"

  if File.exists?(oh_my_zsh) # 檢查 $HOME 目錄下是不是已經有 .oh_my_zsh 資料夾
    puts "已經找到 .oh_my_zsh"
  else
    puts "正在安裝 oh_my_zsh 中"
    system %Q{curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh}
  end
end
