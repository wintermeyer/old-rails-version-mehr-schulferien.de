FactoryGirl.define do
  factory :period do
    sequence(:first_day) { |n| Date.today + (7 * n).days }
    sequence(:last_day) { |n| Date.today + (7.1 * n).round.days }

    holiday
    association :periodable, factory: :federal_state
  end

end
