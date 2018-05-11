require 'board'

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
		end
	end

  describe '#strike_position' do
    context 'when the row and column are valid positions in the play area' do
      context 'when the cell at the given does not contain a ship' do
        it 'it strikes the cell and updates the status report' do
          row = 1
          column = 1
          board.strike_position(row: row, column: column)
          expect(board.play_area[row][column]).to eq 'X'
          expect(board.status_report.downcase).to include 'miss'
        end
      end
    end
  end
end
