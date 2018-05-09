require 'engine'
require 'console_ui'

RSpec.describe Engine do

  let(:console_ui) { instance_double(ConsoleUI) }
  subject(:engine) { described_class.new(interface: console_ui) }

  describe '#start' do
    it 'starts the game' do
      expect(console_ui).to receive(:greet)

      engine.start
    end
  end
end
