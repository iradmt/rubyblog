FactoryGirl.define do
  factory :comment do
    text "My comment"
  	article_id 1
  	user_id 1
  end
end
