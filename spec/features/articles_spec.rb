require 'rails_helper'

feature 'Articles' do
  given(:user) { create :user }

  scenario 'Creating article as plain user' do
    login_as user
    visit '/'
    click_link 'New Article'
    within '#new_article' do
      fill_in 'Title', with: 'Example'
      fill_in 'Content', with: 'Abra Ka Dabra'
    end
    click_button 'Create Article'
    expect(page).to have_content 'Article was successfully created'
    expect(page).to have_content 'Example'
    expect(page).to have_content 'Abra Ka Dabra'
  end
end
