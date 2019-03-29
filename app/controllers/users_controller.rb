class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:danger] = t "flash.error"
      redirect_to signup_users_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t "flash.success"
      redirect_to @user
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
    end
end
