module Features
  module SessionHelpers
    def signin(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_on 'Log in'
    end
    def signup(email,password,password_confirmation)
      visit new_user_registration_path
      fill_in 'Email', with:email
      fill_in 'Password', with:password
      fill_in 'Password confirmation', with:password_confirmation
      click_on 'Sign up'
    end
  end
end