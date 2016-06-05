class UsersController < ApplicationController
	before_filter :authenticate_user!

	def index
		@users=User.all
	end

	def show
		@user=User.find(params[:id])
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	def set_admin
		@user = User.find(params[:id])
    	@user.set_admin
    	@user.save
    	redirect_to @user
	end
end
