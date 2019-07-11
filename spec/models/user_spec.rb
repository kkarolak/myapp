require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it do
      should have_many(:comments)
    end
    it do
      should have_many(:articles)
    end
  end
end
