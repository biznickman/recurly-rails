class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		# Handle a successful save
      # Create a user's Recurly account to associate this with
      redirect_to new_subscription_path
  	else
  		render 'new'
  	end
  end
end
