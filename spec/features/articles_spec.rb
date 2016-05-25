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

  context 'Given an article' do
    given!(:article) { create :article, user: user }

    scenario 'Editing article as plain user' do
      login_as user
      visit '/'
      click_link article.title
      expect(page).to have_content article.content
      click_link 'Edit'
      within '.edit_article' do
        fill_in 'Title', with: 'Example'
        fill_in 'Content', with: 'Abra Ka Dabra'
      end
      click_button 'Update Article'
      expect(page).to have_content 'Article was successfully updated'
      expect(page).to have_content 'Example'
      expect(page).to have_content 'Abra Ka Dabra'
    end

    scenario 'Deleting article as plain user' do
      login_as user
      visit '/'
      click_link 'Delete'
      expect(page).not_to have_content article.title
      expect(page).to have_content 'Article was successfully destroyed'
    end
  end
end
