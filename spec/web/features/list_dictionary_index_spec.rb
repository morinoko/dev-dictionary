require 'features_helper'

RSpec.describe 'List dictionary index' do
  let(:repository) { WordRepository.new }

  before do
    repository.clear

    repository.create(en: 'value', ja: '価', kana: 'あたい', romaji: 'atai')
    repository.create(en: 'authentication', ja: '認証', kana: 'にんしょう', romaji: 'ninshō')
    repository.create(en: 'authorization', ja: '権限管理', kana: 'けんげん かんり', romaji: 'kengen kanri')
  end

  it 'displays the dictionary entries on the page' do
    visit '/'

    within '.index' do
      expect(page).to have_selector('.word', count: 3), 'Expected to find 3 words'
    end
  end
end
