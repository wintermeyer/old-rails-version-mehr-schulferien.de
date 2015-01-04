require 'test_helper'

class PhoneNumbersControllerTest < ActionController::TestCase
  # TODO Write tests for anonymous user.

  setup do
    @phone_number = FactoryGirl.build(:phone_number)
    @user = FactoryGirl.build(:user)
    @user.save
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phone_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phone_number" do
    assert_difference('PhoneNumber.count') do
      post :create, phone_number: { name: @phone_number.name, phone_numberable_id: @phone_number.phone_numberable_id, phone_numberable_type: @phone_number.phone_numberable_type, value: @phone_number.value }
    end

    assert_redirected_to phone_number_path(assigns(:phone_number))
  end

  test "should show phone_number" do
    @phone_number.save
    get :show, id: @phone_number
    assert_response :success
  end

  test "should get edit" do
    @phone_number.save
    get :edit, id: @phone_number
    assert_response :success
  end

  test "should update phone_number" do
    @phone_number.save
    patch :update, id: @phone_number, phone_number: { name: @phone_number.name, phone_numberable_id: @phone_number.phone_numberable_id, phone_numberable_type: @phone_number.phone_numberable_type, value: @phone_number.value }
    assert_redirected_to phone_number_path(assigns(:phone_number))
  end

  test "should destroy phone_number" do
    @phone_number.save
    assert_difference('PhoneNumber.count', -1) do
      delete :destroy, id: @phone_number
    end

    assert_redirected_to phone_numbers_path
  end
end
