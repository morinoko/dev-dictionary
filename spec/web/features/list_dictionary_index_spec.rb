require 'features_helper'

RSpec.describe 'List dictionary index' do
  it 'displays the dictionary on the page' do
    visit '/'

    within '.index' do
      expect(page).to have_css('.letter', count: 2)
    end
  end
end