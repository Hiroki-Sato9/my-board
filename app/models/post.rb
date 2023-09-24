class Post < ApplicationRecord
  belongs_to :user
  belongs_to :board
  default_scope -> { order(created_at: :asc) }

  validates :user_id, presence: true
  validates :board_id, presence: true
  validates :content, presence: true
end
