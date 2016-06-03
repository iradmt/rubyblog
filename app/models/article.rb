class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5  }
	validates :content, presence: true, length: { minimum: 5  }
	default_scope -> { order('created_at DESC') } 
end
