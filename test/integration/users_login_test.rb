require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # include Warden::Test::Helpers
  def setup
    @user = users(:one)
  end

  test "login path" do
    get new_user_session_url
    assert_template 'users/sessions/new'
  end

  test "valid login" do
    sign_in @user
    get root_url
    assert_match "Log out", response.body
    assert flash.empty?
  end
end
