class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    render :show 
  end

  def show
    @user = User.find(params[:id])
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:birthday)
  end

end
