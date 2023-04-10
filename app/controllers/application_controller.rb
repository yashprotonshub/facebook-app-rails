class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    def after_sign_out_path_for(resource)
        new_user_session_path    
    end


    def after_sign_in_path_for(resource)
        user_posts_path(current_user) 
    end
end


