require 'rails_helper'

feature 'Articles' do
  given(:user) { create :user }
  given(:admin) { create :admin }

  scenario 'user can create an article' do
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

  context 'Given an article owned by user' do
    given!(:article) { create :article, user: user }

    scenario 'user can edit an article' do
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

    scenario 'user can delete an article' do
      login_as user
      visit '/'
      click_link 'Delete'
      expect(page).not_to have_content article.title
      expect(page).to have_content 'Article was successfully destroyed'
    end

    scenario 'admin can edit an article' do
      login_as admin
      visit '/'
      click_link 'Edit'
      within '.edit_article' do
        fill_in 'Content', with: 'Abra Ka Dabra'
      end
      click_button 'Update Article'
      expect(page).to have_content 'Article was successfully updated'
      expect(page).to have_content 'Abra Ka Dabra'
    end

    scenario 'admin can delete an article' do
      login_as admin
      visit '/'
      click_link 'Delete'
      expect(page).to have_content 'Article was successfully destroyed'
    end

    scenario 'anonymous cannot edit or delete an article' do
      visit '/'
      expect(page).not_to have_content 'Edit'
      expect(page).not_to have_content 'Delete'
      click_link article.title
      expect(page).not_to have_content 'Edit'
      expect(page).not_to have_content 'Delete'
    end
  end

  context 'Given an article owned by admin' do
    given!(:article) { create :article, user: admin }

    scenario 'user cannot edit or delete an article' do
      login_as user
      visit '/'
      expect(page).not_to have_content 'Edit'
      expect(page).not_to have_content 'Delete'
      click_link article.title
      expect(page).not_to have_content 'Edit'
      expect(page).not_to have_content 'Delete'
    end

    scenario 'admin can edit or delete an article' do
      login_as admin
      visit '/'
      expect(page).to have_content 'Edit'
      expect(page).to have_content 'Delete'
      click_link article.title
      expect(page).to have_content 'Edit'
      expect(page).to have_content 'Delete'
    end
  end
end
