require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  # Test the factory
  #
  test "should save the default factory girl" do
    school = FactoryGirl.build(:school)
    assert school.save
  end

  # Test validations
  #
  test "should not save without name" do
    school = FactoryGirl.build(:school, name: nil)
    assert_not school.save

    school.name = ''
    assert_not school.save
  end

  test "should not save without address_line1" do
    school = FactoryGirl.build(:school, address_line1: nil)
    assert_not school.save

    school.address_line1 = ''
    assert_not school.save
  end

  test "should not save without zip_code" do
    school = FactoryGirl.build(:school, zip_code: nil)
    assert_not school.save

    school.zip_code = ''
    assert_not school.save
  end

  test "should not save without address_city_name" do
    school = FactoryGirl.build(:school, address_city_name: nil)
    assert_not school.save

    school.address_city_name = ''
    assert_not school.save
  end

  test "should not save with 3 digit zip_code" do
    school = FactoryGirl.build(:school, zip_code: '123')
    assert_not school.save
  end

  test "should not save with 6 digit zip_code" do
    school = FactoryGirl.build(:school, zip_code: '123456')
    assert_not school.save
  end

  test "should not save with 'abcde' zip_code" do
    school = FactoryGirl.build(:school, zip_code: 'abcde')
    assert_not school.save
  end

end
