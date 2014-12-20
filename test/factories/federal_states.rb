FactoryGirl.define do
  factory :federal_state do
    country
    sequence(:name) { |n| "#{country.name}#{n}" }
  end

end
