class ConsoleUI
  def initialize(output: $stdout)
    @output = output
  end

  def greet
    output.puts "Welcome to Battleship!"
  end

  private

  attr_reader :output
end
