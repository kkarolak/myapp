require 'rails_helper'

describe Admin::ArticlePolicy do
  subject { Admin::ArticlePolicy }

  let (:current_user) {FactoryGirl.build_stubbed :user,:user}
  let (:admin) {FactoryGirl.build_stubbed :user, :admin}

  permissions :index? do
    it 'denies access if not an admin' do
      expect(subject).not_to permit(current_user)
    end
    it 'allows access to admin' do
      expect(subject).to permit(admin)
    end
  end
  permissions :show? do
    it "prevents other users seeing articles in admin page" do
      expect(subject).not_to permit(current_user)
    end
    it "allows an admin to see any article" do
      expect(subject).to permit(admin)
    end
  end
   permissions :update? do
   it "prevents updates if not an admin" do
     expect(subject).not_to permit(current_user)
    end
    it "allows an admin to make updates" do
       expect(subject).to permit(admin)
    end
  end
  permissions :create? do
    it "prevents creating article" do
      expect(subject).to_not permit(current_user)
    end
    it "allows creating article" do
      expect(subject).to permit(admin)
    end
  end
  permissions :destroy? do
   it "prevents deleting article" do
    expect(subject).to_not permit(current_user)
  end
  it "allows an admin to delete any article" do
   expect(subject).to permit(admin)
  end
  end
end
