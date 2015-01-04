require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  # Test the factory
  #
  test "should save the default factory girl" do
    phone_number = FactoryGirl.build(:phone_number)
    assert phone_number.save
  end

  # Test validations
  #
  test "should not save without value" do
    phone_number = FactoryGirl.build(:phone_number, value: nil)
    assert_not phone_number.save
  end

  test "should not save without name" do
    phone_number = FactoryGirl.build(:phone_number, name: nil)
    assert_not phone_number.save
  end

  # different value inputs have to be formated
  #
  test "should convert the value of (030)12345 to +49-30-12345" do
    phone_number = FactoryGirl.build(:phone_number, value: '(030)12345')
    assert phone_number.save

    assert_equal "+49-30-12345", phone_number.value
  end

  test "should convert the value of 030-12345 to +49-30-12345" do
    phone_number = FactoryGirl.build(:phone_number, value: '030-12345')
    assert phone_number.save

    assert_equal "+49-30-12345", phone_number.value
  end

  test "should convert the value of 030 12345 to +49-30-12345" do
    phone_number = FactoryGirl.build(:phone_number, value: '030 12345')
    assert phone_number.save

    assert_equal "+49-30-12345", phone_number.value
  end

  test "should convert the value of 030/12345 to +49-30-12345" do
    phone_number = FactoryGirl.build(:phone_number, value: '030/12345')
    assert phone_number.save

    assert_equal "+49-30-12345", phone_number.value
  end
end
