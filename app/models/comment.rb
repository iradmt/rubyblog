class Comment < ActiveRecord::Base
  belongs_to :article
  validates :text, presence: true, length: { maximum:100 }
  validates :article_id, presence: true
end
