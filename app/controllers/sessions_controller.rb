class SessionsController < ApplicationController
  def new; end
  

 def create
  user = User.find_by(email: params[:email])
  if user&.authenticate(params[:password])
    session[:user_id] = user.id
    respond_to do |format|
      format.html { redirect_to chat_rooms_path, notice: "Logged in!" }
      format.turbo_stream { redirect_to chat_rooms_path, notice: "Logged in!" }
    end
  else
    flash.now[:alert] = "Invalid email or password"
    render :new, status: :unprocessable_entity
  end
end



  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end
end
