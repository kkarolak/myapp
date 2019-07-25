require 'rails_helper'

describe ArticlePolicy do
  subject {ArticlePolicy }

  let (:current_user) {FactoryGirl.build_stubbed :user, :user }
  let (:admin) {FactoryGirl.build_stubbed :user, :admin}

  permissions :index? do
    it 'allows access if not an admin' do
      expect(UserPolicy).to permit(current_user)
    end
    it 'allows access to admin' do
      expect(UserPolicy).to permit(admin)
    end
  end
  permissions :show? do
    it "allows users seeing selected article" do
      expect(subject).to permit(current_user)
    end
    it "allows an admin to see any article" do
      expect(subject).to permit(admin)
    end
  end


end
