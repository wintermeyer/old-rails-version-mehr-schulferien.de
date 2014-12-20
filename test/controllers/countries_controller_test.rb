require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  # TODO Write tests for anonymous user.
  
  setup do
    @country = FactoryGirl.build(:country)
    @user = FactoryGirl.build(:user)
    @user.save
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country" do
    assert_difference('Country.count') do
      post :create, country: { name: @country.name, url_prefix: @country.url_prefix }
    end

    assert_redirected_to country_path(assigns(:country))
  end

  test "should show country" do
    @country.save
    get :show, id: @country.slug
    assert_response :success
  end

  test "should get edit" do
    @country.save
    get :edit, id: @country.save
    assert_response :success
  end

  test "should update country" do
    @country.save
    patch :update, id: @country, country: { name: @country.name, url_prefix: @country.url_prefix }
    assert_redirected_to country_path(assigns(:country))
  end

  test "should destroy country" do
    @country.save
    assert_difference('Country.count', -1) do
      delete :destroy, id: @country.slug
    end

    assert_redirected_to countries_path
  end
end
