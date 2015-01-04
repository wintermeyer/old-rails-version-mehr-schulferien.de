FactoryGirl.define do
  factory :phone_number do
    name "Telefon"
    sequence(:value) { |n| "+49-30-227#{('11111'..'99999').to_a[n]}" }
    association :phone_numberable, factory: :school
  end

end
