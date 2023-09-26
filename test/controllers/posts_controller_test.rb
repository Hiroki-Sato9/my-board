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

  test "should destroy posts" do
    @post = posts(:post1)
    get board_path(@board)

    assert_template 'boards/show'
    assert_difference 'Post.count', -1 do
      delete post_path(@post)
    end
  end
end
