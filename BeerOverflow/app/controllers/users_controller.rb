class UsersController < ApplicationController


  def index
    @user = User.find(session[:user_id])
    p @user.questions
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      session[:user_id] = @user.id
      # root_path ? 
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    session[:user_id] = nil
    redirect_to '/'
  end

 private
  def user_params
  params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
