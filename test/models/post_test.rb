require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @board = boards(:one)
    @post = @board.posts.build(content: "Test")
  end

  test 'should be valid' do
    @post.user_id = @user.id
    @post.valid?
  end
end
