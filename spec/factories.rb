FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@bar.com"} 
    password "123456"
  end

  trait :api_token do
      api_token 'ofQCUqyiq91eKzfHr1pTrbpT'
    end
  

  factory :post do
    association :user

    title "second title"
    sequence(:url) { |n| "http://localhost:300#{n}/second-title" }
  end
end