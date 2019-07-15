RSpec.describe CommentsController, type: :controller do
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
      it 'create new comment if logged in' do
      expect{post :create, params:{comment:params,article_id:article.id}  }.to change(Comment, :count).by(1)
      expect(flash[:success]).to eq "Udało się dodać komentarz! Poczekaj na zaakceptowanie go przez administratora"
      end
    end
  end
end

