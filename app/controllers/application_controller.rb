class ApplicationController < ActionController::Base
  #The before_action() line causes the authorize() method to be invoked before every 
  #controller defined action in our application.
  before_action :authorize
  
  protected
  
    def authorize
        unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log-in."
        end
    end
    

end
