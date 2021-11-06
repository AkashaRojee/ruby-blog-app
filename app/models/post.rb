class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def increment_counter
    user.update(posts_counter: user.posts_counter + 1)
  end

  def liked?(user_id)
    likes.exists?(user_id: user_id)
  end

  def recent_comments(limit = 5)
    comments.last(limit)
  end
end
