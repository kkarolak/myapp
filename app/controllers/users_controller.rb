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

  private

    def secure_params
      params.require(:user).permit(:role)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
