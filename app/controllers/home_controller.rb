class HomeController < ApplicationController
  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
	def logout
		@user = current_user
		sign_out @user
		redirect_to new_user_session_path
	end
end
