class ApplicationController < ActionController::Base
    #for top-level authentication
    before_action :authenticate_user!

end
