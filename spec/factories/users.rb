FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'password'
    trait :user do
      role 'user'
    end
    trait :admin do
      role 'admin'
    end
  end
  factory :article do
    id 1
    title 'Test article'

    description 'Test description'
    user_id 1
  end
  factory :comment do
    comment 'test'
    article_id 1
    user_id 1
  end
end
