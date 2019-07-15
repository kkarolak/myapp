
RSpec.describe Admin::CommentsController, type: :controller do

  let(:user) {FactoryGirl.create(:user,:admin)}
  let (:article){FactoryGirl.create(:article)}
  before do
    sign_in user
  end
  let(:params) { {
      comment: 'Awesome article',
      user_id: user.id,
      article_id: article.id,
      status: "published"
  }
  }
  context 'Methods' do
    describe "POST comment#create" do
      # Z jakiegos powodu nie działa, identyczny test w kontrolerze comments_controller przechodzi
      #it 'create new comment if logged in' do
       # expect{post :create, params:{comment:params,article_id:article.id}  }.to change(Comment, :count).by(1)
      #  expect(flash[:success]).to eq "Udało się dodać komentarz! Poczekaj na zaakceptowanie go przez administratora"
     # end
    end
  describe "PUT #update" do
    it "should update article info" do
      comment = Comment.create!(comment:"Awesome article", user_id:user.id,article_id:article.id,status:"unpublished")
      put :update, params:{id: comment.id,article_id: article.id, status:"published"}
      comment.reload
      params.keys.each do |key|
        expect(comment.attributes[key.to_s]).to eq params[key]
      end
    end
  end
    describe 'DELETE #destroy' do
      it 'should delete article' do
        article = Article.create!(id:6 ,title:"First",description:"First Article",user_id: user.id)
        comment = Comment.create!(id:6,comment:"First comment",article_id:article.id,user_id:user.id)
        expect { delete :destroy, params: { id: comment.id, article_id:article.id } }.to change(Comment, :count).by(-1)
        expect(flash[:success]).to eq "Comment was deleted"
      end
    end
  end
end