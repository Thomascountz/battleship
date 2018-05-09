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
  end

  def get_coordinate
    input.gets.chomp
  end

  private

  attr_reader :output, :input

  def format_board(board)
    board_string = horizontal_line 
    board_string << newline
    board.play_area.each_with_index do |row, row_number|
      row.each_with_index do |cell, cell_number|
        board_string << "#{pipe} #{row_number}#{cell_number} "
      end
      board_string << pipe 
      board_string << newline 
      board_string << horizontal_line 
      board_string << newline
    end
    board_string
  end

  def newline
    "\n"
  end

  def horizontal_line
    "-" * 51
  end

  def pipe
    "|"
  end

end
