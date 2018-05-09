require 'console_ui'

RSpec.describe ConsoleUI do

  let(:output) { StringIO.new }
  subject(:console_ui) { described_class.new(output: output) }

  describe '#greet' do
    it 'prints a greeting to output' do
      console_ui.greet

      expect(output.string).to include("Welcome", "Battleship")
    end
  end

end
