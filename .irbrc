require 'irb/completion'
require 'pp'
require 'wirble'

IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY]=100000

Wirble.init
Wirble.colorize
