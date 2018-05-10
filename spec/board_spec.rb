require 'board'
require 'cell'

RSpec.describe Board do

  subject(:board) { described_class.new }

  describe '#play_area' do
    context 'when initialized' do
      it 'is a 10x10 Array of Arrays' do
        expect(board.play_area).to be_a Array
        expect(board.play_area.first).to be_a Array
        expect(board.play_area.first.length).to be 10
        expect(board.play_area.flatten.length).to be 100
      end

      it 'is made up of unique Cell objects' do
        expect(board.play_area.flatten).to_not be_empty
        expect(board.play_area.flatten).to all be_instance_of Cell
        expect(board.play_area.flatten.length).to eq board.play_area.flatten.uniq.length
      end
    end
  end
end
