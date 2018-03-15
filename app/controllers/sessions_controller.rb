class SessionsController < ApplicationController
  #Do not require login for Sessions Controller.
  skip_before_action :authorize
  
  def new
  end
  
  def create
    user = User.find_by(name: params[:name])
      if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      #Had to add _index to make this work
      redirect_to admin_index_url
      else
      redirect_to login_url, alert: "Nope!"
      end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: "Logout success!"
  end
end