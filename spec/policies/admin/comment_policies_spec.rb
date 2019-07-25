require 'rails_helper'

describe Admin::CommentPolicy do
  subject { Admin::CommentPolicy }

  let (:current_user) {FactoryGirl.build_stubbed :user,:user}
  let (:admin) {FactoryGirl.build_stubbed :user, :admin}
   permissions :create? do
     it "prevents creating if not an admin" do
       expect(subject).not_to permit(current_user)
     end
     it "allows creating if admin" do
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
  permissions :destroy? do
   it "prevents deleting yourself" do
    expect(subject).not_to permit(current_user)
  end
  it "allows an admin to delete any comment" do
    expect(subject).to permit(admin)
  end
  end
end
