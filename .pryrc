# Sublime Text FTW
Pry.config.editor = "subl -w"

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
begin
  require '~/Code/Project/interactive_editor/lib/interactive_editor.rb'
rescue LoadError => err
  warn "Couldn't load interactive_editor: #{err}"
end
