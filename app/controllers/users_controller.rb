class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		# Handle a successful save
      #redirect_to subscription_path
  	else
  		render 'new'
  	end
  end
end
