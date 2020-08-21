class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :authorized
  
    def set_current_user
        @current_user ||=User.find_by(id: session[:user_id])
    end


    def authorized
        redirect_to home_path unless set_current_user 
    end 

    def authorized_admin
        redirect_to home_path unless set_current_user.admin == true
    end
end
