require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "valid article" do
    before do 
    	@article = FactoryGirl.create(:article)
    end

    subject { @article }

    it { should respond_to :title }
    it { should respond_to :description }
    it { should respond_to :content }
    it { should respond_to :user_id }
    it { should be_valid }
  end

  describe "invalid article" do
  	context "when content is shorter than 5 symbols" do
	  	before do 
	    	@article = Article.create(title: "My content", description: "Some description", content: "Some", user_id: 1)
	    end

	    subject { @article }

	    it { should_not be_valid }
	end

	context "when user_id is nil" do
	  	before do 
	    	@article = Article.create(title: "My title", description: "Some description", content: "Some content", user_id: nil)
	    end

	    subject { @article }

	    it { should_not be_valid }
	end
  end
end
