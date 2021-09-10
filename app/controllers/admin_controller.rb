class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user!

  private

  def validate_user!
    return if current_user && current_user.has_role?(:admin)
    redirect_to root_path
  end
end
