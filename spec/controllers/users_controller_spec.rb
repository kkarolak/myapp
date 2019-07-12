require 'rails_helper'


RSpec.describe UsersController, type: :controller do
  let(:user) {FactoryGirl.create(:user,:user)}
  before do
    sign_in user
  end
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
  end
end