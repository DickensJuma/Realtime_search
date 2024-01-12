require 'rails_helper'

RSpec.describe 'Searches', type: :system do
  it 'displays recent searches' do
    visit searches_path
    expect(page).to have_content('Realtime Search Analytics')

    fill_in 'query', with: 'example search'
    click_button 'Search'

    visit searches_path
    expect(page).to have_content('example search')
  end
end
