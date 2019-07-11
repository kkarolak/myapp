require 'rails_helper'

feature 'User index page', :devise do
  scenario 'user sees own email address' do
    user = FactoryGirl.create(:user, :user)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content user.email
  end
  scenario 'user sees listed articles' do
    user = FactoryGirl.create(:user, :user)
    login_as(user, scope: :user)
    visit articles_path
    expect(page).to have_content "Listing all articles"
  end
  scenario 'user sees home page' do
    user = FactoryGirl.create(:user, :user)
    login_as(user, scope: :user)
    visit root_path
    expect(page).to have_content "Home Page"
  end
  scenario 'user sees about page' do
    user = FactoryGirl.create(:user, :user)
    login_as(user, scope: :user)
    visit about_path
    expect(page).to have_content "About Blog"
  end
  scenario 'user sees Log out link' do
    user = FactoryGirl.create(:user, :user)
    login_as(user, scope: :user)
    visit root_path
    expect(page).to have_content "Log out"
  end
end