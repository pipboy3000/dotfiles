require 'irb/completion'

IRB.conf[:AUTO_INDENT]=true
IRB.conf[:SAVE_HISTORY]=100000

begin
  require 'awesome_print'
rescue LoadError
else
  AwesomePrint.irb!
end

