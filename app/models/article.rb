class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	validates :title, presence: true, length: { minimum: 5  }
	validates :description, presence: true, length: { minimum: 5, maximum: 140 }
	validates :content, presence: true, length: { minimum: 5  }
	validates :user_id, presence: true
	default_scope -> { order('created_at DESC') } 
end
