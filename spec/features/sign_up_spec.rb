require 'rails_helper'

feature 'Sign up', :devise do
  scenario 'user cannot sign up if password confirmation does not match password' do
    signup('person@example.com', 'password','passwor')
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario 'user cannot sign up if email is blank' do
    signup('', 'password','password')
    expect(page).to have_content "Email can't be blank"
  end

  scenario 'user cannot sign up if password is blank' do
    signup('person@example.com', '','')
    expect(page).to have_content "Password can't be blank"
  end

  scenario 'user cannot sing up with already taken email' do
    user = FactoryGirl.create(:user)
    signup(user.email,'password','password')
    expect(page).to have_content "Email has already been taken"
  end

end