class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :variables
  # before_action :project_id_session

  def current_user

    if session.nil?
      redirect_to '/'
    else
      User.find(session[:id]) if session[:id]
    end

  end

  # def project_id_session
  #   if current_page?(:controller => 'dreamstart', :action => 'index')
  #     # session[:project_id].clear
  #   end
  # end

  def variables
    @countries = ["Australia","Canada","France","Mexico","Spain","Norway","Netherlands","United States"]
    @categories = ["Art","Music","Film and Video","Tech","Dance","Fashion","Games","Photography","Theather","Food"]
  end

  helper_method :current_user

end