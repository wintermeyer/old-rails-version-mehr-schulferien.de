require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # Test the factory
  #
  test "should save the default factory girl country" do
    country = FactoryGirl.build(:country)
    assert country.save
  end

  # Test validations
  #
  test "should not save country without name" do
    country = FactoryGirl.build(:country, name: nil)
    assert_not country.save
  end

  test "should not save country without url_prefix" do
    country = FactoryGirl.build(:country, url_prefix: nil)
    assert_not country.save
  end

  test "should not save country with upcase url_prefix" do
    country = FactoryGirl.build(:country, url_prefix: 'Aa')
    assert_not country.save
  end

  test "should not save country with 4 letter url_prefix" do
    country = FactoryGirl.build(:country, url_prefix: 'abcd')
    assert_not country.save
  end

  test "should not save the same country twice" do
    country1 = FactoryGirl.build(:country)
    country2 = FactoryGirl.build(:country)
    country2.name = country1.name
    country2.url_prefix = country1.url_prefix
    assert country1.save
    assert_not country2.save
  end

  # Test inflections(locale = :de) for the slug
  #
  test "should create the slug 'oesterreich' for 'Österreich'" do
    country = FactoryGirl.build(:country, name: 'Österreich')
    assert country.save
    assert_equal country.slug, 'oesterreich'
  end


end
