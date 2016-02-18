class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])

    if @user
      # @user ? if_successful : if_not_successful

      # if_successful
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in as #{@user.nickname}"
      redirect_to dashboard_path
    else
      # if_not_successful
      flash[:alert] = "Failed to login"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
