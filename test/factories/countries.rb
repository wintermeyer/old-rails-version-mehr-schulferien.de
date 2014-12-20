FactoryGirl.define do
  factory :country do
    sequence(:name) { |n| "Example Country #{n}" }
    sequence(:url_prefix) { |n| ('a'..'zz').to_a[n] }
  end
end
