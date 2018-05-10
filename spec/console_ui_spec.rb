require 'console_ui'
require 'board'

RSpec.describe ConsoleUI do

  let(:output) { StringIO.new }
  subject(:console_ui) { described_class.new(output: output) }

  describe '#greet' do
    it 'prints a greeting to output' do
      console_ui.greet

      expect(output.string).to include("Welcome", "Battleship")
    end
  end

  describe '#display_board' do
    it 'prints the board to output' do
      board = Board.new
      console_ui.display_board(board)

      expected = "-------------------------------------------------------------------\n|     |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |\n-------------------------------------------------------------------\n|  0  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |\n-------------------------------------------------------------------\n|  1  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |\n-------------------------------------------------------------------\n|  2  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |\n-------------------------------------------------------------------\n|  3  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |\n-------------------------------------------------------------------\n|  4  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |\n-------------------------------------------------------------------\n|  5  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |\n-------------------------------------------------------------------\n|  6  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |\n-------------------------------------------------------------------\n|  7  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |\n-------------------------------------------------------------------\n|  8  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |\n-------------------------------------------------------------------\n|  9  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |  .  |\n-------------------------------------------------------------------\n"

      expect(output.string).to eq expected
    end
  end

  describe '#prompt' do
    it 'gives the user direction to input a coordinate' do
      console_ui.prompt

      expect(output.string.downcase).to include("enter", "position")
    end
  end

  describe '#get_coordinate' do
    it 'gets a coordiante from input' do
      input = StringIO.new("32\n")
      console_ui = ConsoleUI.new(input: input)
      expect(console_ui.get_position).to eq('32')
    end
  end
end
