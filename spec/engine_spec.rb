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
      row = "row"
      column = "column"
      status_report = "STATUS REPORT"

      expect(console_ui).to receive(:greet)
      expect(console_ui).to receive(:display_board).with(board)
      expect(console_ui).to receive(:get_row).and_return(row)
      expect(console_ui).to receive(:get_column).and_return(column)
      expect(board).to receive(:strike_position).with(row: row, column: column)
      expect(board).to receive(:status_report).and_return(status_report)
      expect(console_ui).to receive(:display_status_report).with(status_report)
      expect(console_ui).to receive(:display_board).with(board)

      engine.start
    end
  end
end
