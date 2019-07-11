require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it "validates presence of title" do
      should validate_presence_of(:title)
    end
    it "validates length of title" do
      should validate_length_of(:title).
          is_at_least(3)
      should validate_length_of(:title).
          is_at_most(50)
    end
    it "validates presence of description" do
      should validate_presence_of(:description)
    end
    it "validates length of description" do
      should validate_length_of(:description).
          is_at_least(10)
      should validate_length_of(:description).
          is_at_most(300)
    end

    it "validates presence of user id" do
      should validate_presence_of(:user_id)
    end

  end
  describe 'associations' do
    it {should have_many(:comments)}
  end
end