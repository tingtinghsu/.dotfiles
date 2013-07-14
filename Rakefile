# encoding: UTF-8
require "rake"

# 實體表。實體名稱與 shell 顏色色碼的對照。
GREEN = "\033[0;32m"
NONE  = "\033[0m"

desc "install dot files to $HOME directory"
task :install do
  puts
  puts GREEN + "======================================================" + NONE
  puts GREEN + "Welcome to Ching-Han Ho's DotFiles Installation."       + NONE
  puts GREEN + "======================================================" + NONE
  puts

  # Because we need git when we install oh-my-zsh
  if RUBY_PLATFORM.downcase.include?("darwin")
    install_homebrew
    install_essential_tools
  end

  # if RUBY_PLATFORM.downcase.include?("linux")
    # TODO: install some packages
  # end
  install_oh_my_zsh

  files = Dir['.*'] - %w[. .. .DS_Store .git .gitignore .oh-my-zsh .config]
  files << Dir.glob(".oh-my-zsh/custom/*")
  files << Dir.glob(".config/fish/*")
  files = files.flatten
  files.delete_if { |x| x.match(/\.\w+\.sw[a-z]/) }

  puts GREEN + "======================================================" + NONE
  puts GREEN + "Looking for existing config and backing up it..."       + NONE
  puts GREEN + "======================================================" + NONE
  puts

  backup_files(files)
  link_files(files)
  success_msg
end

private

  def run(cmd)
    puts "\033[0;33m[Running]\033[0m #{cmd}"
    `#{cmd}`
  end

  def success_msg
    puts
    puts GREEN + "  _____ _    _ _    _ _____  ______ " + NONE
    puts GREEN + " / ____| |  | | |  | |  __ \\|  ____|" + NONE
    puts GREEN + "| |    | |__| | |__| | |  | | |__   " + NONE
    puts GREEN + "| |    |  __  |  __  | |  | |  __|  " + NONE
    puts GREEN + "| |____| |  | | |  | | |__| | |     " + NONE
    puts GREEN + " \\_____|_|  |_|_|  |_|_____/|_|     " + NONE
    puts
    puts "CHHDF has been installed. Please restart your terminal."
    puts
  end

  def backup_files(files)
    run %{mkdir -p #{ENV["HOME"]}/.dotfiles_backup} unless File.exists?("#{ENV["HOME"]}/.dotfiles_backup")

    files.each do |file|
      target = "#{ENV["HOME"]}/#{file}"

      if File.exist?("#{target}")
        run %{rm -rf #{target}} if File.symlink?("#{target}")
        run %{mv #{target} #{ENV["HOME"]}/.dotfiles_backup} if File.file?("#{target}") || File.directory?("#{target}")
      end
    end
  end

  def link_files(files)
    puts
    puts GREEN + "======================================================" + NONE
    puts GREEN + "Setting up symbol link files..."                        + NONE
    puts GREEN + "======================================================" + NONE
    puts

    files.each do |file|
      source = "#{ENV["PWD"]}/#{file}"
      target = "#{ENV["HOME"]}/#{file}"

      run %{ln -s #{source} #{target}}
    end
  end

  def install_oh_my_zsh
    puts GREEN + "======================================================" + NONE
    puts GREEN + "Installing oh-my-zsh"                                   + NONE
    puts GREEN + "A handful of functions, auto-complete helpers,"         + NONE
    puts GREEN + "and stuff that makes you shout..."                      + NONE
    puts GREEN + "======================================================" + NONE
    puts

    oh_my_zsh = "#{ENV["HOME"]}/.oh-my-zsh"

    if File.exists?(oh_my_zsh)
      puts "\033[0;33mYou already have Oh My Zsh installed.\033[0m"
      # TODO: 怎麼處理已經存在的檔案（.oh-my-zsh）？
    else
      run %{curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh}
    end
  end

  def install_essential_tools
    puts GREEN + "======================================================" + NONE
    puts GREEN + "Installing Homebrew git package..."                     + NONE
    puts GREEN + "There may be some warnings."                            + NONE
    puts GREEN + "It will ignore if git is already installed."            + NONE
    puts GREEN + "======================================================" + NONE
    run %{./.brew}
    puts
  end

  def install_homebrew
    puts GREEN + "======================================================" + NONE
    puts GREEN + "Installing Homebrew, the OSX package manager...If it's" + NONE
    puts GREEN + "already installed, this will do nothing."               + NONE
    puts GREEN + "======================================================" + NONE
    run %{ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"}
    puts
  end

# "\033[0;32m" + NONE
