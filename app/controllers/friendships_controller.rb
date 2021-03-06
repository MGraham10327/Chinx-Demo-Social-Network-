class FriendshipsController < ApplicationController
	before_action :authentication_user!
	before_action :set_user, only: [:create]

	def create
		@friendship = current_user.request_friendship(@user)
		respond_to do |format|
			format.html {redirect_to users_path, notice: "Friendship Created"}
		end
	end

	private

	def set_user
		@user = User.find(params[:user_id])
	end

	def destroy
		@friendship.destroy
		respond_to do |format|
			format.html {redirect_to users_path, notice: "Friendship Deleted"}
		end
	end

	def set_friendship
		@friendship = Friendship.find(params[:id])
	end

	def accept
		@friendship.accept_friendship
		respond_to do |format|
			format.html {redirect_to users_path, notice: "Friendship Accepted"}			
		end
	end
end