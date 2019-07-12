require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy }

  let (:current_user) {FactoryGirl.build_stubbed :user, :user }
  let (:other_user)   {FactoryGirl.build_stubbed :user, :user }
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
    it "allows other users seeing your profile" do
      expect(subject).to permit(current_user, other_user)
    end
    it "allows you to see your own profile" do
      expect(subject).to permit(current_user, current_user)
    end
    it "allows an admin to see any profile" do
      expect(subject).to permit(admin)
    end
  end


end
