require 'hello_world'

RSpec.describe HelloWorld do
  describe '#hello_world' do
    it 'returns a string saying hello' do
      hello_world = HelloWorld.new

      result = hello_world.hello

      expect(result).to eq("Hello, World!")
    end
  end
end
