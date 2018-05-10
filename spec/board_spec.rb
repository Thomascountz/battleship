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

  describe '#strike_position' do
    context 'when the position has not yet been struck' do
      it 'sets the cell at that position as hit' do
        position = 21
        board.strike_position(position)
        expect(board.cell_at(position)).to be_hit
      end
    end
    context 'if the position has already been struck' do
      it 'returns false' do
        position = 21
        board.cell_at(position).strike
        expect(board.strike_position(position)).to be false
      end
    end
    context 'if the position is invalid' do
      it 'returns false' do
        position = 100
        expect(board.strike_position(position)).to be false
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

  describe '#game_over?' do
    it 'returns true when all ships are sunk' do
      expect(board.game_over?).to be false
    end
  end
end
