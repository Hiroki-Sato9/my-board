class Board < ApplicationRecord
  has_many :posts
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :posts, length: { minimum: 1 }, allow_blank: true

  def close_board
    update_attribute(:activated, false)
  end
end
