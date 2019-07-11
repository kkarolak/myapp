feature 'User index page', :devise do
  scenario 'admin sees listed users with their roles' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit admin_users_path
    expect(page).to have_content "Manage Users"
  end
  scenario 'admin  sees listed articles' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit admin_articles_path
    expect(page).to have_content "Manage Articles"
  end
  scenario 'admin sees home page' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit admin_root_path
    expect(page).to have_content "Admin Panel"
  end
  scenario 'admin sees selected article with comments' do
    user = FactoryGirl.create(:user, :admin)
    article = FactoryGirl.create(:article)
    login_as(user, scope: :user)
    visit "/admin/articles/#{article.id}"
    expect(page).to have_content "Comment"
  end
  scenario 'admin sees selected user page ' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit "/admin/users/#{user.id}"
    expect(page).to have_content user.email
  end
end