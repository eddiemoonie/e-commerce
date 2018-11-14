class UsersController < ApplicationController
  before_action :set_user, only[:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sessions[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    parasm.require(:user).permit(
      :username,
      :password,
      :email
    )
  end 
end
