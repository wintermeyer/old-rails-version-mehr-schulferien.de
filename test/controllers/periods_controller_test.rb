require 'test_helper'

class PeriodsControllerTest < ActionController::TestCase
  # TODO Write tests for anonymous user.
  
  setup do
    @period = FactoryGirl.build(:period)
    @user = FactoryGirl.build(:user)
    @user.save
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create period" do
    assert_difference('Period.count') do
      post :create, period: { first_day: @period.first_day, holiday_id: @period.holiday_id, last_day: @period.last_day, periodable_id: @period.periodable_id, periodable_type: @period.periodable_type }
    end

    assert_redirected_to period_path(assigns(:period))
  end

  test "should show period" do
    @period.save
    get :show, id: @period
    assert_response :success
  end

  test "should get edit" do
    @period.save
    get :edit, id: @period
    assert_response :success
  end

  test "should update period" do
    @period.save
    patch :update, id: @period, period: { first_day: @period.first_day, holiday_id: @period.holiday_id, last_day: @period.last_day, periodable_id: @period.periodable_id, periodable_type: @period.periodable_type }
    assert_redirected_to period_path(assigns(:period))
  end

  test "should destroy period" do
    @period.save
    assert_difference('Period.count', -1) do
      delete :destroy, id: @period
    end

    assert_redirected_to periods_path
  end
end
