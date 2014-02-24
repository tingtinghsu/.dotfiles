# If You are using RVM please checkout `~/.rvm/scripts/irbrc.rb`
# before modify this file...

require "rubygems"

# Save loads of history
require "irb/ext/save-history"
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File.join(ENV["HOME"], ".irb-history")

# Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE] = :SIMPLE

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

# Automatic Indentation
# IRB.conf[:AUTO_INDENT] = true

# interactive editor: use my favorite editor from within irb
# begin
#   require '~/Code/Project/interactive_editor/lib/interactive_editor.rb'
# rescue LoadError => err
#   warn "Couldn't load interactive_editor: #{err}"
# end
