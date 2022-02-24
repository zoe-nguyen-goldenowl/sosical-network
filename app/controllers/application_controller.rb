class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # unless  before_action :authenticate_user!
    #      redirect_to new_user_session_path
    # end
     
end
