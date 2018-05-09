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

      expected ="---------------------------------------------------\n| 00 | 01 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09 |\n---------------------------------------------------\n| 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 |\n---------------------------------------------------\n| 20 | 21 | 22 | 23 | 24 | 25 | 26 | 27 | 28 | 29 |\n---------------------------------------------------\n| 30 | 31 | 32 | 33 | 34 | 35 | 36 | 37 | 38 | 39 |\n---------------------------------------------------\n| 40 | 41 | 42 | 43 | 44 | 45 | 46 | 47 | 48 | 49 |\n---------------------------------------------------\n| 50 | 51 | 52 | 53 | 54 | 55 | 56 | 57 | 58 | 59 |\n---------------------------------------------------\n| 60 | 61 | 62 | 63 | 64 | 65 | 66 | 67 | 68 | 69 |\n---------------------------------------------------\n| 70 | 71 | 72 | 73 | 74 | 75 | 76 | 77 | 78 | 79 |\n---------------------------------------------------\n| 80 | 81 | 82 | 83 | 84 | 85 | 86 | 87 | 88 | 89 |\n---------------------------------------------------\n| 90 | 91 | 92 | 93 | 94 | 95 | 96 | 97 | 98 | 99 |\n---------------------------------------------------\n" 

      expect(output.string).to eq expected
    end
  end

  describe '#prompt' do
    it 'gives the user direction to input a coordinate' do
      console_ui.prompt

      expect(output.string).to include("Please", "coordinate")
    end
  end

  describe '#get_coordinate' do
    it 'gets a coordiante from input' do
      input = StringIO.new("32\n")
      console_ui = ConsoleUI.new(input: input)
      expect(console_ui.get_coordinate).to eq('32')
    end
  end
end
