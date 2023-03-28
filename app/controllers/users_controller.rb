# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  def index; end

  def show; end

  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find(params[:username])

    if @user.update(update_user_params)
      redirect_to action: :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def update_user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :birthdate, :username)
  end
end
