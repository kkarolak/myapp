require 'rails_helper'

RSpec.describe Admin::ArticlesController, type: :controller do
  let(:user) {FactoryGirl.create(:user,:admin)}
  let (:article){FactoryGirl.create(:article)}
  before do
    sign_in user
  end
  let(:params) { {
      title: 'Awesome article',
      description: 'Description'
  }
  }
  context 'Methods' do
    describe "GET articles#index" do
      it "index action should be success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
    describe "GET articles#show" do
      it "show action should be success" do
        get :show, params: {id:article.id}
        expect(response).to have_http_status(:success)
      end
    end
    describe "POST articles#create" do
      it 'create new article if logged in' do
        expect{(post :create,  params:{article: params})}.to change(Article, :count).by(1)
      end
      it 'do not create article if not admin user' do
        user1 = User.create!(email:"test@o2.pl",password:"password",password_confirmation:"password")
        sign_in user1
        expect{(post :create,  params:{article: params})}.to change(Article, :count).by(0)
      end
    end
    describe "PUT #update" do
      it "should update article info" do
        put :update, params:{id: article.id, article: params}
        article.reload
        params.keys.each do |key|
          expect(article.attributes[key.to_s]).to eq params[key]
        end
      end
    end
    describe 'DELETE #destroy' do
      it 'should delete article' do
        article = Article.create!(id:6 ,title:"First",description:"First Article",user_id: user.id)
        expect { delete :destroy, params: { id: article.id } }.to change(Article, :count).by(-1)
        expect(flash[:success]).to eq "Article was deleted"
      end
    end
  end
end
