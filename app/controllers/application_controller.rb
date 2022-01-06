class ApplicationController < ActionController::Base
  private
  def current_user
    @_current_user ||= session[:current_user_id] &&
      user.find_by(id: session[:current_user_id])
  end

  before_action :require_login

  private
# ......................................Filters...................................
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url
    end
  end

      # ...........another.............
  # before_action do |controller|
  #   unless controller.send(:logged_in?)
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to new_login_url
  #   end
  # end
  
      # ...........another.............
#   before_action LoginFilter
      
# class LoginFilter
#   def self.before(controller)
#     unless controller.send(:logged_in?)
#       controller.flash[:error] = "You must be logged in to access this section"
#       controller.redirect_to controller.new_login_url
#     end
#   end
end
