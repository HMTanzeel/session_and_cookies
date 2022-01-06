class LoginsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def create
    if user = User.authenticate(params[:usersname], params[:password])
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end

  def destroy
    session.delete(:current_user_id)
    @_current_user = nil
    redirect_to root_url
  end

end
