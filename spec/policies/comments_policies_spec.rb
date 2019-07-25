require 'rails_helper'

describe CommentPolicy do
  subject {CommentPolicy }

  let (:current_user) {FactoryGirl.build_stubbed :user, :user }
  let (:admin) {FactoryGirl.build_stubbed :user, :admin}

  permissions :create? do
    it "prevents creating if not an admin" do
      expect(subject).to permit(current_user)
    end
    it "allows creating if not an admin" do
      expect(subject).to permit(admin)
    end
  end
  permissions :index? do
    it 'allows access if not an admin' do
      expect(UserPolicy).to permit(current_user)
    end
    it 'allows access to admin' do
      expect(UserPolicy).to permit(admin)
    end
  end

end
