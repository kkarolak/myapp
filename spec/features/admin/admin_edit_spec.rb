feature 'User index page', :devise do
  scenario 'admin sees selected edit user form' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit "/admin/users/#{user.id}/edit"
    expect(page).to have_content "Edit User Account"
  end
  scenario 'admin  sees selected edit article form' do
    user = FactoryGirl.create(:user, :admin)
    article = FactoryGirl.create(:article)
    login_as(user, scope: :user)
    visit "/admin/articles/#{article.id}/edit"
    expect(page).to have_content "Edit Article"
  end

end