# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user.present?
  end

  def create
    user = User.find_by(email: params[:user][:email].downcase)

    if user&.authenticate(params[:user][:password])
      session[:user_id] = user.id
    else
      flash[:alert] = t('controllers.invalid_login')
    end

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
