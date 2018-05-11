require_relative "console_ui"
require_relative "board"

class Engine
  def initialize(interface: ConsoleUI.new,
                 board: Board.new)
    @interface = interface
    @board = board
  end

  def start
    interface.greet
    interface.display_board(board)
    row = interface.get_row
    column = interface.get_column
  end

  private

  attr_reader :interface, :board
end
