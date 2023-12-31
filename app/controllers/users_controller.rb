# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    redirect_to root_path if current_user.present?

    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
