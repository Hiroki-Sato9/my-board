require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @board = boards(:one)
    @post = @board.posts.build(content: "Test")
    @post.user_id = @user.id
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'user id should be present' do
    @post.user_id = nil
    refute @post.valid?
  end

  test 'board id should be present' do
    @post.board_id = nil
    refute @post.valid?
  end

  test 'content should be present' do
    @post.content = nil
    refute @post.valid?
  end

  test 'order should be most recent first' do
    assert_equal posts(:most_rescent), Post.first
  end
end
