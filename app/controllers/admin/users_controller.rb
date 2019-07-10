class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created!"
      redirect_to admin_users_path(@user)
    else
      render 'new'
    end
  end
  def update
    authorize @user
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to admin_users_path
    else
      flash[:success] = "User was not updated"
      render 'edit'
    end
  end
  def edit
  end
  def show
    authorize @user
  end
  def destroy
    authorize @user
    @user.destroy
    flash[:success] = "User was deleted"
    redirect_to admin_users_path
  end
  def set_user
    @user = User.find(params[:id])
  end
  def index
    @user = User.all
    authorize User
  end
  private
  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation,:role)
  end
end