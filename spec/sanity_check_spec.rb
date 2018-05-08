require 'sanity_check'

RSpec.describe SanityCheck do
  describe '#check' do
    it 'says hello to the world' do
      subject = SanityCheck.new

      result = subject.check

      expect(result).to eq "Hello, World!"
    end
  end
end

