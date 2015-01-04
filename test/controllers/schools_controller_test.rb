require 'test_helper'

class SchoolsControllerTest < ActionController::TestCase
  # TODO Write tests for anonymous user.

  setup do
    @school = FactoryGirl.build(:school)
    @user = FactoryGirl.build(:user)
    @user.save
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school" do
    assert_difference('School.count') do
      post :create, school: { address_city_name: @school.address_city_name, address_line1: @school.address_line1, address_line2: @school.address_line2, city_id: @school.city_id, email_address: @school.email_address, homepage_url: @school.homepage_url, name: @school.name, slug: @school.slug, street: @school.street, zip_code: @school.zip_code }
    end

    assert_redirected_to school_path(assigns(:school))
  end

  test "should show school" do
    @school.save
    get :show, id: @school
    assert_response :success
  end

  test "should get edit" do
    @school.save
    get :edit, id: @school
    assert_response :success
  end

  test "should update school" do
    @school.save
    patch :update, id: @school, school: { address_city_name: @school.address_city_name, address_line1: @school.address_line1, address_line2: @school.address_line2, city_id: @school.city_id, email_address: @school.email_address, homepage_url: @school.homepage_url, name: @school.name, slug: @school.slug, street: @school.street, zip_code: @school.zip_code }
    assert_redirected_to school_path(assigns(:school))
  end

  test "should destroy school" do
    @school.save
    assert_difference('School.count', -1) do
      delete :destroy, id: @school
    end

    assert_redirected_to schools_path
  end
end
