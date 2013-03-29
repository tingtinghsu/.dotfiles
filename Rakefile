# encoding: UTF-8
require "rake"

desc "install dot files to $HOME directory"
task :install do
  puts
  puts "\033[0;32m" + "======================================================" + "\033[0m"
  puts "\033[0;32m" + "Welcome to Ching-Han Ho's DotFiles Installation."       + "\033[0m"
  puts "\033[0;32m" + "======================================================" + "\033[0m"
  puts

  # Because we need git when we install oh-my-zsh
  if RUBY_PLATFORM.downcase.include?("darwin")
    install_homebrew
    install_git_by_homebrew
  end

  # if RUBY_PLATFORM.downcase.include?("linux")
    # TODO: install some packages
  # end
  install_oh_my_zsh

  files = Dir['.*'] - %w[. .. .DS_Store .git .gitignore .oh-my-zsh]
  files << Dir.glob(".oh-my-zsh/custom/*")
  files = files.flatten
  files.delete_if { |x| x.match(/\.\w+\.sw[a-z]/) }

  puts "\033[0;32m" + "======================================================" + "\033[0m"
  puts "\033[0;32m" + "Looking for existing config and backing up it..."       + "\033[0m"
  puts "\033[0;32m" + "======================================================" + "\033[0m"
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
    puts "\033[0;32m" + "  _____ _    _ _    _ _____  ______ " + "\033[0m"
    puts "\033[0;32m" + " / ____| |  | | |  | |  __ \\|  ____|" + "\033[0m"
    puts "\033[0;32m" + "| |    | |__| | |__| | |  | | |__   " + "\033[0m"
    puts "\033[0;32m" + "| |    |  __  |  __  | |  | |  __|  " + "\033[0m"
    puts "\033[0;32m" + "| |____| |  | | |  | | |__| | |     " + "\033[0m"
    puts "\033[0;32m" + " \\_____|_|  |_|_|  |_|_____/|_|     " + "\033[0m"
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
    puts "\033[0;32m" + "======================================================" + "\033[0m"
    puts "\033[0;32m" + "Setting up symbol link files..."                        + "\033[0m"
    puts "\033[0;32m" + "======================================================" + "\033[0m"
    puts

    files.each do |file|
      source = "#{ENV["PWD"]}/#{file}"
      target = "#{ENV["HOME"]}/#{file}"

      run %{ln -s #{source} #{target}}
    end
  end

  def install_oh_my_zsh
    puts "\033[0;32m" + "======================================================" + "\033[0m"
    puts "\033[0;32m" + "Installing oh-my-zsh"                                   + "\033[0m"
    puts "\033[0;32m" + "A handful of functions, auto-complete helpers,"         + "\033[0m"
    puts "\033[0;32m" + "and stuff that makes you shout..."                      + "\033[0m"
    puts "\033[0;32m" + "======================================================" + "\033[0m"
    puts

    oh_my_zsh = "#{ENV["HOME"]}/.oh-my-zsh"

    if File.exists?(oh_my_zsh)
      puts "\033[0;33mYou already have Oh My Zsh installed.\033[0m"
      # TODO: 怎麼處理已經存在的檔案（.oh-my-zsh）？
    else
      run %{curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh}
    end
  end

  def install_git_by_homebrew
    puts "\033[0;32m" + "======================================================" + "\033[0m"
    puts "\033[0;32m" + "Installing Homebrew git package..."                     + "\033[0m"
    puts "\033[0;32m" + "There may be some warnings."                            + "\033[0m"
    puts "\033[0;32m" + "It will ignore if git is already installed."            + "\033[0m"
    puts "\033[0;32m" + "======================================================" + "\033[0m"
    run %{brew install git}
    puts
  end

  def install_homebrew
    puts "\033[0;32m" + "======================================================" + "\033[0m"
    puts "\033[0;32m" + "Installing Homebrew, the OSX package manager...If it's" + "\033[0m"
    puts "\033[0;32m" + "already installed, this will do nothing."               + "\033[0m"
    puts "\033[0;32m" + "======================================================" + "\033[0m"
    run %{ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"}
    puts
  end

# "\033[0;32m" + "\033[0m"
