class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates :text, presence: true, length: { maximum:100 }
  validates :article_id, presence: true
  validates :user_id, presence: true
end
