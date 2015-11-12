begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError
  puts 'no awesome print :('
end

begin
  require 'hirb'
rescue LoadError
  puts 'no hirb :('
end

if defined? Hirb
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end
  end

  def disable_output_method
    Pry.config.print = @old_print
    @output_method = nil
  end

  Hirb.enable
end
