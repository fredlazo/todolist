class UsersController < ApplicationController

	before_action :authenticate_user!

	def show
		@user = current_user
		@items = @user.items
	end

	private

	def user_params
		params.require(:user).permit(:email)
	end
end
