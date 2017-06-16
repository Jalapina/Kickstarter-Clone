class UsersController < ApplicationController
  def new
  end

  def create
  
    @user = User.new user_params
    
    if @user.valid?
      @user.save
      session[:id] = @user.id
      session[:name] = @user.name
      redirect_to '/'
    else
      flash[:errors] = @user.errors.full_messages
      render json: {result:flash[:errors]}
    end
  
   end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
