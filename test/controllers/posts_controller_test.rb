require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    @board = boards(:one)
    sign_in @user
  end

  test 'should create posts' do
    assert_difference 'Post.count', 1 do
      post posts_path, params: {
        post: {
          content: "Test",
          board_id: @board.id
        }
      }
    end
  end
end
