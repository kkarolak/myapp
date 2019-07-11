require 'rails_helper'

feature 'User show page', :devise do
  scenario 'user sees own email address' do
    user = FactoryGirl.create(:user, :user)
    login_as(user, scope: :user)
    visit "/users/#{user.id}"
    expect(page).to have_content user.email
  end
  scenario 'not logged in user sees You need to sign in or sign up before continuing.' do
    user = FactoryGirl.create(:user, :user)
    visit "/users/#{user.id}"
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
feature 'Article show page', :devise do
  scenario 'user sees selected article' do
    user = FactoryGirl.create(:user, :user)
    article = FactoryGirl.create(:article)
    login_as(user,scope: :user)
    visit "/articles/#{article.id}"
    expect(page).to have_content article.title
  end
  scenario 'not logged in user sees You need to sign in or sign up before continuing.' do
    article = FactoryGirl.create(:article)
    visit "/articles/#{article.id}"
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end

