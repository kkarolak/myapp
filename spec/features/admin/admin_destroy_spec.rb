feature 'User index page', :devise do
  scenario 'admin can delete selected user' do
    user = FactoryGirl.create(:user, :admin)
    user1 = User.create!(id:2,email:"foo@bar.com",password:"password",password_confirmation:"password")
    login_as(user, scope: :user)
    page.driver.submit :delete, "/admin/users/#{user1.id}",{}
    expect(page).to have_content "User was deleted"
  end
  scenario 'admin can delete selected attribute' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    article = Article.create!(id:1,title:"example title",description:"example description",user_id:user.id)
    page.driver.submit :delete, "/admin/articles/#{article.id}",{}
    expect(page).to have_content "Article was deleted"
  end
  scenario 'admin can delete selected comment' do
    user = FactoryGirl.create(:user, :admin)
    login_as(user, scope: :user)
    article = Article.create!(id:1,title:"example title",description:"example description",user_id:user.id)
    comment = Comment.create!(id:1,comment:"example comment",user_id:user.id,article_id:article.id)
    page.driver.submit :delete, "/admin/articles/#{article.id}/comments/#{comment.id}",{}
    expect(page).to have_content "Comment was deleted"
  end

end


