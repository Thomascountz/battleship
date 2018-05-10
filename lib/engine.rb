require_relative "console_ui"
require_relative "board"

class Engine
  def initialize(interface: ConsoleUI.new, board: Board.new)
    @interface = interface
    @board = board
  end

  def start
    interface.greet
    until board.game_over?
      interface.display_board(board)
      interface.prompt
      position = interface.get_position
      until board.strike_position(position)
        position = interface.get_position
      end
    end
  end

  private

  attr_reader :interface, :board
end
