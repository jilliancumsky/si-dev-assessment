class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to action: "show", id: @user.id
    else
      redirect_to action: "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:body, :to)
  end

end
