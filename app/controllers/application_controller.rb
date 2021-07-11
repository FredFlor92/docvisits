class ApplicationController < ActionController::Base
    
   include SessionsHelper

#    before_action :current_user
#     # def current_user
#     #     @current_user ||= User.find_by_id(session[:user_id])
#     # end 
#     # # def check_for_if_logged_in
#     # #     redirect_to '/' if !logged_in?
#     # # end 
#     private
#     def authentication_required
#         if !logged_in?
#         redirect_to "/login"
#         end 
#     end

end
