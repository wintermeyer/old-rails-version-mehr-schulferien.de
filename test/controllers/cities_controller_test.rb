require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  # TODO Write tests for anonymous user.

  setup do
    @city = FactoryGirl.build(:city)
    @user = FactoryGirl.build(:user)
    @user.save
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create city" do
    assert_difference('City.count') do
      post :create, city: { federal_state_id: @city.federal_state_id, name: @city.name, slug: @city.slug, zip_code: @city.zip_code }
    end

    assert_redirected_to city_path(assigns(:city))
  end

  test "should show city" do
    @city.save
    get :show, id: @city
    assert_response :success
  end

  test "should get edit" do
    @city.save
    get :edit, id: @city
    assert_response :success
  end

  test "should update city" do
    @city.save
    patch :update, id: @city, city: { federal_state_id: @city.federal_state_id, name: @city.name, slug: @city.slug, zip_code: @city.zip_code }
    assert_redirected_to city_path(assigns(:city))
  end

  test "should destroy city" do
    @city.save
    assert_difference('City.count', -1) do
      delete :destroy, id: @city
    end

    assert_redirected_to cities_path
  end
end
