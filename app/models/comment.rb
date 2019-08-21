class Comment < ApplicationRecord
  belongs_to :micropost
  belongs_to :user

  validates :comment_text, presence: true
end
