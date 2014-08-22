Pry.config.editor = "vim"

# https://github.com/kyrylo/pry-theme
Pry.config.theme = "pry-modern"

# See https://gist.github.com/807492
# Use Array.toy to get an array to play with
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

# Use Hash.toy to get an hash to play with
class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

# interactive editor: use my favorite editor from within irb
# begin
#   require '~/Code/Project/interactive_editor/lib/interactive_editor.rb'
# rescue LoadError => err
#   warn "Couldn't load interactive_editor: #{err}"
# end

# From: https://gist.github.com/rondale-sc/1297510
# Default Command Set, add custom methods here:
default_command_set = Pry::CommandSet.new do
  # command "copy", "Copy argument to the clip-board" do |str|
  #    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  # end

  command "clear" do
    system 'clear'
    if defined?(Rails)
      output.puts "Rails Environment: #{Rails.env}"
    end
  end

  # command "sql", "Send sql over AR." do |query|
  #   if Rails.env || defined?(Rails)
  #     pp ActiveRecord::Base.connection.select_all(query)
  #   else
  #     pp "Pry did not require the environment, try `pconsole`"
  #   end
  # end
  # command "caller_method" do |depth|
  #   depth = depth.to_i || 1
  #   if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth+1).first
  #     file   = Regexp.last_match[1]
  #     line   = Regexp.last_match[2].to_i
  #     method = Regexp.last_match[3]
  #     output.puts [file, line, method]
  #   end
  # end
end

Pry.config.commands.import default_command_set

# Defined aliases
Pry.config.commands.alias_command "c", "clear"

require 'awesome_print'
AwesomePrint.pry!

# Use Hirb gem with Pry
begin
  require 'hirb'
  require 'hirb-unicode'
  extend Hirb::Console
rescue LoadError => e
  # Missing goodies, bummer
end

if defined? Rails
  Pry.config.prompt_name = Rails.application.class.parent_name.underscore.dasherize

  unless Rails.env.development?
    old_prompt = Pry.config.prompt

    if Rails.env.production?
      Pry::Helpers::Text.red(Rails.env.upcase)
    else
      Pry::Helpers::Text.yellow(Rails.env.upcase)
    end

    Pry.config.prompt = [
      proc { |*a| "#{env} #{old_prompt.first.call(*a)}"  },
      proc { |*a| "#{env} #{old_prompt.second.call(*a)}" }
    ]
  end
end
