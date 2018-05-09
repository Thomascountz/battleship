require 'engine'
require 'console_ui'
require 'board'

RSpec.describe Engine do

  let(:console_ui) { instance_double(ConsoleUI) }
  let(:board) { instance_double(Board) }
  subject(:engine) { described_class.new(interface: console_ui,
                                         board: board) }

  describe '#start' do
    it 'starts the game' do
      expect(console_ui).to receive(:greet)
      expect(console_ui).to receive(:display_board).with(board)
      expect(console_ui).to receive(:prompt)
      expect(console_ui).to receive(:get_coordinate)

      engine.start
    end
  end
end
