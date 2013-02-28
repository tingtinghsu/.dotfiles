# If You are using RVM please checkout `~/.rvm/scripts/irbrc.rb`
# before modify this file...

require "rubygems"

# Save loads of history
require "irb/ext/save-history"
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File.join(ENV["HOME"], ".irb-history")

# Remove the annoying irb(main):001:0 and replace with >>
# IRB.conf[:PROMPT_MODE] = :SIMPLE

# Automatic Indentation
# IRB.conf[:AUTO_INDENT] = true
