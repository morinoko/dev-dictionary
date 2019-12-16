RSpec.describe Web::Controllers::Words::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[word: { en: 'value', ja: '価', kana: 'あたい', romaji: 'atai' }] }
  let(:repository) { WordRepository.new }

  before do
    repository.clear
  end

  it 'creates a new word' do
    action.call(params)
    word = repository.last

    expect(word.id).to_not be_nil
  end

  it 'redirects the user to the dictionary index' do
    response = action.call(params)

    expect(response[0]).to eq(302)
    expect(response[1]['Location']).to eq('/')
  end
end
