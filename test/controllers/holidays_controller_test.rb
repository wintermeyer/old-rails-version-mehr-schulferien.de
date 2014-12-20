require 'test_helper'

class HolidaysControllerTest < ActionController::TestCase
  # TODO Write tests for anonymous user.

  setup do
    @holiday = FactoryGirl.build(:holiday)
    @user = FactoryGirl.build(:user)
    @user.save
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:holidays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create holiday" do
    assert_difference('Holiday.count') do
      post :create, holiday: { name: @holiday.name }
    end

    assert_redirected_to holiday_path(assigns(:holiday))
  end

  test "should show holiday" do
    @holiday.save
    get :show, id: @holiday.slug
    assert_response :success
  end

  test "should get edit" do
    @holiday.save
    get :edit, id: @holiday.slug
    assert_response :success
  end

  test "should update holiday" do
    @holiday.save
    patch :update, id: @holiday.slug, holiday: { name: @holiday.name }
    assert_redirected_to holiday_path(assigns(:holiday))
  end

  test "should destroy holiday" do
    @holiday.save
    assert_difference('Holiday.count', -1) do
      delete :destroy, id: @holiday.slug
    end

    assert_redirected_to holidays_path
  end
end
