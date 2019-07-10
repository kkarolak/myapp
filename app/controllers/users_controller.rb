class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update, :show, :destroy]
  after_action :verify_authorized
  def new
    @user = User.new
  end
  def index
    @users = User.all
    authorize User
  end

  def show
    authorize @user
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, :notice => "User deleted"
  end

  def update
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :success => "User updated"
    else
      redirect_to users_path, :alert => "Unable to update user"
    end

  end

  private

    def secure_params
      params.require(:user).permit(:role)
    end

    def set_article
      @user = User.find(params[:id])
    end
end
