require_relative '../app'

RSpec.describe :App do
  describe '.generate_cmc_hash' do
    context 'with a valid deck' do
      let(:deck_file) { File.expand_path('../fixtures/example_deck.dec', __FILE__) }
      let(:set_names) { 'EMN,SOI' }

      it 'generates the expected hash' do
        target_hash = {
          '0' => 0,
          '1' => 5,
          '2' => 6,
          '3' => 5,
          '4' => 3,
          '5' => 1,
          '6' => 0,
          '7' => 0,
          '8' => 0,
          '9' => 0,
          '10' => 0
        }
        result = App.new(set_names, deck_file).generate_cmc_hash
        expect(result).to be_a Hash
      end
    end
  end
end
