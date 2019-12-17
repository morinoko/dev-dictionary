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

  it 'displays list of errors when params contains errors' do
    visit 'words/new'

    within '.word-form' do
      click_button 'Create'
    end

    expect(current_path).to eq '/words'

    expect(page).to have_content('There was a problem with your submission')
    expect(page).to have_content('English must be filled')
    expect(page).to have_content('Japanese must be filled')
    expect(page).to have_content('Kana must be filled')
    expect(page).to have_content('Romaji must be filled')
  end
end