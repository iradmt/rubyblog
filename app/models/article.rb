class Article < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5  }
	validates :content, presence: true, length: { minimum: 5  }
	default_scope -> { order('created_at DESC') } 
end
