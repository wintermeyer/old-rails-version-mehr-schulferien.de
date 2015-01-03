require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # Test the factory
  #
  test "should save the default factory girl city" do
    city = FactoryGirl.build(:city)
    assert city.save
  end

  # Test validations
  #
  test "should not save without name" do
    city = FactoryGirl.build(:city, name: nil)
    assert_not city.save
  end

  test "should not save without zip_code" do
    city = FactoryGirl.build(:city, zip_code: nil)
    assert_not city.save
  end

  test "should not save without federal_state_id" do
    city = FactoryGirl.build(:city, federal_state_id: nil)
    assert_not city.save
  end

  # Test inflections(locale = :de) for the slug
  #
  test "should create the slug '56462-hoehn' for '56562 Höhn'" do
    city = FactoryGirl.build(:city, name: 'Höhn', zip_code: '56462')
    assert city.save
    assert_equal city.slug, '56462-hoehn'
  end
end
