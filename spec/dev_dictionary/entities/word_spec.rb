RSpec.describe Word, type: :entity do
  it 'can be initialized with attributes' do
    word = Word.new(en: 'value', ja: '価', kana: 'あたい', romaji: 'atai')

    expect(word.en).to eq 'value'
    expect(word.ja).to eq '価'
    expect(word.kana).to eq 'あたい'
    expect(word.romaji).to eq 'atai'
  end
end
