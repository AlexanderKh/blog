require 'rails_helper'

feature 'Articles' do
  given(:user) { create :user }
  given(:admin) { create :admin }
  given(:article) { create :article, user: user }

  scenario 'user can post and interact with own comment', js: true do
    login_as user
    visit article_path(article)

    within '#new_comment' do
      fill_in 'comment_content', with: 'Hello, people'
    end
    click_button 'Comment'
    expect(page).to have_content 'Hello, people'

    find('.comment p', text: 'Hello').click
    comment_form = find('.comment input')
    comment_form.set 'Hi Ladies'
    comment_form.native.send_keys :return
    expect(page).to have_content 'Hi Ladies'

    find('.comment a', text: 'Delete').click
    expect(page).not_to have_content 'Hi Ladies'
  end
end