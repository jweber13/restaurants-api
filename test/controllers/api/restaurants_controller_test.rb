# require '../../test_helper'
require File.join(__dir__, '..', '..', 'test_helper')
# require File.join(Rails.root, 'test', 'test_helper')

class Api::V1::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.create!(username: "user_a", email: "usera@email.com", password: "testtest")
    @restaurant = Restaurant.create!(name: "Dishoom", address: "Paris", user: @user)
  end

  test 'should get index' do
    get api_v1_restaurants_path
    assert_response :success
  end

  test 'should show restaurant' do
    get api_v1_restaurant_path(@restaurant.id)
    assert_response :success
  end

  test 'should create restaurant' do
    sign_in @user

    assert_difference('Restaurant.count') do
      post api_v1_restaurants_path, headers: {
        'X-User-Email': @user.email,
        'X-User-Token': @user.authentication_token,
        'Content-Type': 'application/json'
      }, params: { restaurant: { name: 'New Restaurant', address: '123 Main St' } }.to_json
    end

    assert_response :success
  end

  test 'should update restaurant' do
    sign_in @user

    assert_changes '@restaurant.reload.name', from: @restaurant.name, to: 'Updated Restaurant' do
      patch api_v1_restaurant_path(@restaurant), headers: {
        'X-User-Email': @user.email,
        'X-User-Token': @user.authentication_token,
        'Content-Type': 'application/json'
      }, params: { restaurant: { name: 'Updated Restaurant' } }.to_json
    end
    assert_response :success
  end

  test 'should destroy restaurant' do
    sign_in @user

    assert_difference('Restaurant.count', -1) do
      delete api_v1_restaurant_url(@restaurant), headers: {
        'X-User-Email': @user.email,
        'X-User-Token': @user.authentication_token,
      }
    end
    assert_response :no_content
  end

end
