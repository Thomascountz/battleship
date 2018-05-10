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

  describe '#cell_at' do
    context 'when a cell exists at index' do
      it 'returns the cell at a given index in the play_area' do
        index = 13
        cell = board.play_area[1][3]
        expect(board.cell_at(index)).to be cell
      end
    end
    context 'when a cell does not exist at index' do
      it 'returns nil' do
        index = 100
        expect(board.cell_at(index)).to be nil
      end
    end
    context 'when index is a negative number' do
      it 'returns nil' do
        index = -1
        expect(board.cell_at(index)).to be nil
      end
    end
  end
end
