class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :increment_counter
  
  def increment_counter
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments(limit = 5)
    comments.last(limit)
  end
end
