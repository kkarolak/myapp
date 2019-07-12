class Admin::StaticPagesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  def root
    authorize User
  end
end
