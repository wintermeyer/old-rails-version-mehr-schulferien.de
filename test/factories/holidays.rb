FactoryGirl.define do
  factory :holiday do
    sequence(:name) { |n| "Feiertag Nr. #{n}" }
  end

end
