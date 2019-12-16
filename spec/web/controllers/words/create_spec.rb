RSpec.describe Web::Controllers::Words::Create, type: :action do
  let(:action) { described_class.new }
  let(:repository) { WordRepository.new }

  before do
    repository.clear
  end

  context 'with valid params' do
    let(:params) { Hash[word: { en: 'value', ja: '価', kana: 'あたい', romaji: 'atai' }] }

    it 'creates a new word' do
      action.call(params)
      word = repository.last

      expect(word.id).to_not be_nil
      expect(word.en).to eq params.dig(:word, :en)
      expect(word.ja).to eq params.dig(:word, :ja)
      expect(word.kana).to eq params.dig(:word, :kana)
      expect(word.romaji).to eq params.dig(:word, :romaji)
    end

    it 'redirects the user to the dictionary index' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq '/'
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[word: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors


      expect(errors.dig(:word, :en)).to eq(['is missing'])
      expect(errors.dig(:word, :ja)).to eq ['is missing']
      expect(errors.dig(:word, :kana)).to eq ['is missing']
      expect(errors.dig(:word, :romaji)).to eq ['is missing']
    end
  end
end
