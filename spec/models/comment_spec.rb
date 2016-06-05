require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "valid comment" do
    before do 
    	@comment = FactoryGirl.create(:comment)
    end

    subject { @comment }

    it { should respond_to :text }
    it { should respond_to :article_id }
    it { should respond_to :user_id }
    it { should be_valid }
  end

  describe "invalid comment" do
  	context "when comment is empty" do
	  	before do 
	    	@comment = Comment.create(text: "", article_id: 1,  user_id: 1)
	    end

	    subject { @comment }

	    it { should_not be_valid }
	end

	context "when article_id is nil" do
	  	before do 
	    	@comment = Comment.create(text: "Comment", article_id: nil, user_id: 1)
	    end

	    subject { @comment }

	    it { should_not be_valid }
	end

	context "when user_id is nil" do
	  	before do 
	    	@comment = Comment.create(text: "Comment", article_id: 1, user_id: nil)
	    end

	    subject { @comment }

	    it { should_not be_valid }
	end
  end
end
