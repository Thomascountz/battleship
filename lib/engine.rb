require_relative "console_ui"

class Engine
  def initialize(interface: ConsoleUI.new)
    @interface = interface
  end

  def start
    interface.greet
  end

  private

  attr_reader :interface
end
