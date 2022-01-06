class ApplicationController < ActionController::Base
  private
  def current_user
    @_current_user ||= session[:current_user_id] &&
      user.find_by(id: session[:current_user_id])
  end
end
