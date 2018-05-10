require_relative "cell"

class Board
  attr_reader :play_area

  def initialize
    @play_area = []
    10.times do
      row = []
      10.times do
        row << Cell.new
      end
      @play_area << row
    end
  end

  def strike_position(position)
    cell = cell_at(position)
    if cell && !cell.hit?
      cell.strike
      true
    else
      false
    end
  end

  def cell_at(index)
    return nil if index < 0
    play_area.flatten[index]
  end

  def game_over?
    # TODO
    false
  end
end
