class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def recent_posts(limit = 3)
    posts.last(limit)
  end
end
