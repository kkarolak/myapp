require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it "validates presence of comment" do
      should validate_presence_of(:comment)
    end
    it "validates length of comment" do
      should validate_length_of(:comment).is_at_least(1)
      should validate_length_of(:comment).is_at_most(300)
    end
  end
  describe 'assiociations' do
    it do
      should belong_to(:article)
    end
    it do
      should belong_to(:user)
    end
  end
end