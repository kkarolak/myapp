  FactoryGirl.define do
    factory :comment do
      comment 'test'
      article_id 1
      user_id 1
    end
  end
