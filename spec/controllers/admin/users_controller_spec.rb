require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:user) {FactoryGirl.create(:user,:admin)}
  before do
    sign_in user
  end
  let(:params) { {
      username: "Other name",
      email: "other@email.com",
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
        get :show, params: {id:user.id}
        expect(response).to have_http_status(:success)
      end
    end
    describe "PUT #update" do
      it "should update user info" do
        put :update, params:{id: user.id, user: params}
        user.reload
        params.keys.each do |key|
          expect(user.attributes[key.to_s]).to eq params[key]
        end
      end
    end
    describe 'DELETE #destroy' do
      it 'should delete user' do
        user1 = User.create!(  username: "Other name",
                               email: "other@email.com",password:"password",password_confirmation:"password")
        expect { delete :destroy, params: { id: user1.id } }.to change(User, :count).by(-1)
        expect(flash[:success]).to eq "User was deleted"
      end
    end
  end
end
