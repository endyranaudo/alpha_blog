class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index 
    # byebug
    @user = User.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information has been successfully updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end