RSpec.describe Web::Controllers::Dictionary::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repository) { WordRepository.new }

  before do
    repository.clear

    @word = repository.create(en: 'value', ja: '価', kana: 'あたい', romaji: 'atai')
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'exposes all words' do
    action.call(params)
    expect(action.exposures[:words]).to eq([@word])
  end
end