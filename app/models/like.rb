class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_like_counter(post)
    post.update(commentsCount: Like.where(post: post).count)
  end

  def self.like_exists?(user, post)
    Like.where(user: user, post: post).length.positive?
  end
end
