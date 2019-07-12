feature 'User index page', :devise do
  scenario 'admin can edit and update selected user' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    user1 = User.create!(id:2, username:"test username",email:"test@o2.pl", password:"password", password:"confirmation",role:"user")
    visit "/admin/users/#{user1.id}/edit"
    expect(page).to have_content "Edit User Account"
    fill_in 'Username', with: "Test"
    fill_in 'Password', with: user1.password
    fill_in 'Password confirmation', with: user1.password
    click_button 'Update account'
    expect(page).to have_content "Your account was updated successfully"
  end
  scenario 'admin can edit and update selected article' do
    user = FactoryGirl.create(:user, :admin)
    article = FactoryGirl.create(:article)
    login_as(user, scope: :user)
    visit "/admin/articles/#{article.id}/edit"
    expect(page).to have_content "Edit Article"
    fill_in 'Title', with: "Test"
    click_button 'Update Article'
    expect(page).to have_content "Article was updated"
  end

end