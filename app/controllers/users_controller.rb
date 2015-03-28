class UsersController < ApplicationController
	before_filter :authenticate_user!
	respond_to :html

	def index
		@users = User.all
	end

	def new 
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "User created"
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit 
		@user = User.find(params[:id])
	end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user
      else
        flash.now[:error] = "Please fix the errors."
        render 'edit'
      end
    end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "User deleted"
		redirect_to users_path 
	end 
	
	private 

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
	end
end
