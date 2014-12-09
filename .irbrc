require 'irb/completion'
require "awesome_print"

IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY]=100000

AwesomePrint.irb!
