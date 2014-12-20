require 'test_helper'

class HolidayTest < ActiveSupport::TestCase
  # Test the factory
  #
  test "should save the default factory girl holiday" do
    holiday = FactoryGirl.build(:holiday)
    assert holiday.save
  end

  # Test validations
  #
  test "should not save holiday without name" do
    holiday = FactoryGirl.build(:holiday, name: nil)
    assert_not holiday.save
  end

  test "should not save the same holiday twice" do
    holiday1 = FactoryGirl.build(:holiday)
    holiday2 = FactoryGirl.build(:holiday, name: holiday1.name)
    assert holiday1.save
    assert_not holiday2.save
  end

  # Test inflections(locale = :de) for the slug
  #
  test "should create the slug 'heilige-drei-koenige' for 'Heilige Drei Könige'" do
    holiday = FactoryGirl.build(:holiday, name: 'Heilige Drei Könige')
    assert holiday.save
    assert_equal holiday.slug, 'heilige-drei-koenige'
  end
end
