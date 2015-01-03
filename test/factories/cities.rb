FactoryGirl.define do
  factory :city do
    sequence(:name) { |n| "Example City #{n}" }
    sequence(:zip_code) { |n| ('11111'..'99999').to_a[n] }
    federal_state
  end

end
