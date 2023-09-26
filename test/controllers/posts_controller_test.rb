require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    @board = boards(:one)
    @post = posts(:post1)
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

    get board_path(@board)
    assert_template 'boards/show'
    assert_difference 'Post.count', -1 do
      delete post_path(@post)
    end
  end

  test "comment should create" do
    post comment_post_path(@post), params: { posts: { comment: "hello" } }
    @post.reload
    assert_equal "hello", @post.comment
  end
end
