require "test_helper"

class BoardTest < ActiveSupport::TestCase
  def setup
    @board = boards(:one)
  end

  test "one user" do
    assert_equal "one", @board.user.name
  end

  test "user id should be presence" do
    invalid_board  = @board.dup
    invalid_board.user_id = nil
    refute invalid_board.valid?
  end

  test 'title should be presence' do
    invalid_board = @board.dup
    invalid_board.title = nil
    refute invalid_board.valid?
  end

  test 'there should be one post at least' do
    invalid_board = @board.dup
    invalid_board.posts.each do |post|
      post.destroy
    end
    refute invalid_board.valid?
  end
end
