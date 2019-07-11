class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user
  after_action :verify_authorized
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def update
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
  end
  def destroy
    @user.destroy
    flash[:success] = "User was deleted"
    redirect_to admin_users_path
  end
  def index
    @user = User.all
  end
  def set_user
    @user = User.find(params[:id])
  end
  def authorize_user
    authorize [:admin, User]
  end
  private
  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation,:role)
  end
end