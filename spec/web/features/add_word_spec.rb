require 'features_helper'

RSpec.describe 'Add a word' do
  after do
    WordRepository.new.clear
  end

  it 'can create a new word' do
    visit '/words/new'

    within 'form.word-form' do
      fill_in 'English',  with: 'New word'
      fill_in 'Japanese', with: '新しい単語'
      fill_in 'Hiragana', with: 'あたらしいたんご'
      fill_in 'Romaji', with: 'atarashii tango'

      click_button 'Create'
    end

    expect(page).to have_current_path('/')
    expect(page).to have_content('New word')
  end
end