require 'test_helper'

class FederalStateTest < ActiveSupport::TestCase
  # Test the factory
  #
  test "should save the default factory girl federal_state" do
    federal_state = FactoryGirl.build(:federal_state)
    assert federal_state.save
  end

  # Test validations
  #
  test "should not save federal_state without name" do
    federal_state = FactoryGirl.build(:federal_state, name: nil)
    assert_not federal_state.save
  end

  test "should not save the same federal_state twice" do
    federal_state1 = FactoryGirl.build(:federal_state)
    federal_state2 = FactoryGirl.build(:federal_state)
    federal_state2.name = federal_state1.name
    federal_state2.country = federal_state1.country
    assert federal_state1.save
    assert_not federal_state2.save
  end

  # Test inflections(locale = :de) for the slug
  #
  test "should create the slug 'baden-wuerttemberg' for 'Baden-Württemberg'" do
    federal_state = FactoryGirl.build(:federal_state, name: 'Baden-Württemberg')
    assert federal_state.save
    assert_equal federal_state.slug, 'baden-wuerttemberg'
  end
end
