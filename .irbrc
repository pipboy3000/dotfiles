require 'irb/completion'
require 'pp'
# require 'wirble'
require "awesome_print"

IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY]=100000

# Wirble.init
# Wirble.colorize
AwesomePrint.pry!
