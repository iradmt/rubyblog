class User < ActiveRecord::Base
	before_create :add_role

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :articles, dependent: :destroy
	has_many :comments, dependent: :destroy
	belongs_to :role
	validates :name, presence:true, length: { minimum: 2 }

	def has_role?(role)
		return self.role==Role.find_by_name(role.to_sym)
	end

	def count_articles_comments
		cnt=0
		self.articles.each do |article|
			cnt+=article.comments.count
		end
		return cnt
	end

	def set_admin
		self.role=Role.find_by_name("admin")
	end

	private
		def add_role
			self.role ||= Role.find_by_name("user")
		end
end
