FactoryGirl.define do
  factory :user do
    provider "TestProvider"
    sequence(:uid) { |n| "123#{n}" }
    name "Mr. Example"
    sequence(:oauth_token) { |n| "iojwfwiujksfj2#{n}" }
    oauth_expires_at Time.now + 3.months
  end

end
