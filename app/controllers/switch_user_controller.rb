# frozen_string_literal: true

class SwitchUserController < ApplicationController
  def create
    authorize User, :admin?
    session[:original_user_id] = current_user.id
    sign_in(:user, User.find(params[:id]))
    redirect_to root_url
  end

  def destroy
    sign_in(:user, User.find(session[:original_user_id]))
    session.delete(:original_user_id)
    redirect_to root_url
  end
end
