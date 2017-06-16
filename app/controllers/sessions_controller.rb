class SessionsController < ApplicationController
  def new
    
  end

  def create 

    @user = User.find_by(email:params[:email]).try(:authenticate, params[:password])
    puts '==========',@user
    if @user
      session[:id] = @user.id
      session[:name] = @user.name
      redirect_to '/'
    else
      flash[:errors] = @user.errors.full_messages
    end
    
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
