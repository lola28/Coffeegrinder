class UserController < ApplicationController
  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
  end
end
