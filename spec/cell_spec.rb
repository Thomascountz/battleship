require 'cell'

RSpec.describe Cell do

  subject(:cell) { described_class.new }

  context 'when a new cell is initialized' do
    describe '#hit?' do
      it 'returns false by default' do
        cell = Cell.new
        expect(cell.hit?).to be false
      end
    end
  end

  describe '#stike' do
    it 'sets hit? to true' do
      cell = Cell.new
      cell.strike
      expect(cell.hit?).to be true
    end
  end

  describe '#to_s' do
    context 'when a cell is not hit' do
      it "returns the string representation of an un-hit cell" do
        cell = Cell.new
        expect(cell.to_s).to eq "."
      end
    end

    context 'when a cell has been struck' do
      it "returns the string representation of a hit cell" do
        cell = Cell.new
        cell.strike
        expect(cell.to_s).to eq "X"
      end
    end
  end
end
