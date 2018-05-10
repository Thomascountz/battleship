class ConsoleUI
  def initialize(output: $stdout, input: $stdin)
    @output = output
    @input = input
  end

  def greet
    output.puts "Welcome to Battleship!"
  end

  def display_board(board)
    output.puts format_board(board)
  end

  def prompt
    output.puts "Enter an enemy position.\nFormat: <ROW><COLUMN>\nExample: 29"
  end

  def get_position
    input.gets.chomp.to_i
  end

  private

  attr_reader :output, :input

  def format_board(board)
    board_string = horizontal_line
    board_string << newline
    board_string << top_row
    board_string << horizontal_line
    board_string << newline
    board.play_area.each_with_index do |row, row_number|
      board_string << pipe
      board_string << "  #{row_number}  "
      board_string << pipe
      row.each do |cell|
        board_string << "  #{cell}  "
        board_string << pipe
      end
      board_string << newline
      board_string << horizontal_line
      board_string << newline
    end
    board_string
  end

  def top_row
    "|     |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |\n"
  end

  def newline
    "\n"
  end

  def horizontal_line
    "-" * 67
  end

  def pipe
    "|"
  end
end
