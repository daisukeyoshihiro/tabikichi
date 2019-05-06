class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user &.authenticate(session_params[:password])
      session[:user_id] = @user.id
      flash[:info] = "Successfully logged in."
      redirect_to @user
    else
      flash.now[:danger] = "Invalid credentials."
      render 'new'
    end
  end

    def destroy
      reset_session
      flash[:info] = "Successfully logged out"
      redirect_to login_path
    end
  
  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
