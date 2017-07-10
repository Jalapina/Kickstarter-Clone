class UsersController < ApplicationController
  def new
  end

  def update
    
    @user = User.find(session[:id])

    @user.update user_params

    redirect_to :back

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

  def projects
    @projects = Project.where(user:session[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:bio)
    end
end
