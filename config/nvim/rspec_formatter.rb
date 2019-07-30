class VimFormatter
  RSpec::Core::Formatters.register self, :example_failed

  attr_reader :output

  def initialize(output)
    @output = output
  end

  def example_failed example
    exception = example.execution_result[:exception]
    path = $1 if exception.backtrace.find do |frame|
      frame =~ %r{\b(spec/.*_spec\.rb:\d+)(?::|\z)}
    end
    message = format_message exception.message
    path    = format_caller path
    output.puts "#{path}: #{example.example_group.description.strip} " +
      "#{example.description.strip}: #{message.strip}" if path
  end

  private

  def format_message msg
    msg.gsub("\n", ' ')[0,80]
  end
end
