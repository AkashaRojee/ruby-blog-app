class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def increment_counter
    user.update(posts_counter: user.posts_counter + 1)
end
