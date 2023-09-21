require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    sign_in @user
  end

  test 'should redirect to root' do
    get edit_user_registration_url
    put user_registration_url, params: {
      user: {
        name: "Updated Test",
        email: "foo@bar.com",
        current_password: "password"
      }
    }
    @user.reload
    assert_equal "Updated Test", @user.name
    assert_equal "foo@bar.com", @user.email
  end
end
