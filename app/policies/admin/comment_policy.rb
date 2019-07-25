class Admin::CommentPolicy
  attr_reader :current_user, :model

  def initialize(current_user,model)
    @current_user = current_user
    @user = model
  end
  def edit?
    @current_user.admin?
  end
  def update?
    @current_user.admin?
  end
  def destroy?
    return false if @current_user == @user
    @current_user.admin?
  end
  def create?
    @current_user.admin?
  end
end
