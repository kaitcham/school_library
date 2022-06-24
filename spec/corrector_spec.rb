require_relative '../corrector'

describe Corrector do
  context 'When testing the Corrector class' do
    corrector = Corrector.new

    it 'the method correct_name capitalize the name and trim to 10 length' do
      name = 'kaiittttttt'
      corrected_name = corrector.correct_name(name)
      expect(corrected_name).to eq 'Kaiitttttt'
    end
  end
end
