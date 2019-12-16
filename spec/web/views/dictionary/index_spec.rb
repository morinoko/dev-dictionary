RSpec.describe Web::Views::Dictionary::Index do
  let(:exposures) { Hash[words: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/dictionary/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #words' do
    expect(view.words).to eq(exposures.fetch(:words))
  end

  context 'when there are no words' do
    it 'shows a placeholder message' do
      expect(rendered).to include('<p class="placeholder">There are no dictionary entries yet.</p>')
    end
  end

  context 'when there are words' do
    let(:word1)     { Word.new(en: 'value', ja: '価', kana: 'あたい', romaji: 'atai') }
    let(:word2)     { Word.new(en: 'authentication', ja: '認証', kana: 'にんしょう', romaji: 'ninshō') }
    let(:exposures) { Hash[words: [word1, word2]] }

    it 'lists them all' do
      expect(rendered.scan(/class="word"/).length).to eq(2)
      expect(rendered).to include('value')
      expect(rendered).to include('authentication')
    end

    it 'hides the placeholder message' do
      expect(rendered).to_not include('<p class="placeholder">There are no dictionary entries yet.</p>')
    end
  end
end