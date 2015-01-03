require 'test_helper'

class PeriodTest < ActiveSupport::TestCase
  # Test the factory
  #
  test "should save the default factory girl period" do
    period = FactoryGirl.build(:period)
    assert period.save
  end

  # Test validations
  #
  test "should not save without first_day" do
    period = FactoryGirl.build(:period, first_day: nil)
    assert_not period.save
  end

  test "should not save without last_day" do
    period = FactoryGirl.build(:period, last_day: nil)
    assert_not period.save
  end

  test "should not save with a last_day which is before first_day" do
    period = FactoryGirl.build(:period, first_day: Date.today, last_day: (Date.today - 7.days))
    assert_not period.save
  end
end
