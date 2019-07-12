feature 'User index page', :devise do
  scenario 'admin can create new article' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    visit "/admin/articles/new"
    fill_in 'Title', with: 'Test title'
    fill_in 'Description', with: 'Test description'
    click_button 'Create Article'
    expect(page).to have_content "Article was successfully created!"
  end


end