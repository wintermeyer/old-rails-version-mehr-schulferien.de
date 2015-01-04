FactoryGirl.define do
  factory :school do
    name "MyString"
    address_line1 "MyString"
    street "MyString"
    sequence(:zip_code) { |n| ('11111'..'99999').to_a[n] }
    address_city_name "MyString"
    city
  end

end
