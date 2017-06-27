# frozen_string_literal: true

class Admin::UserController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin
  before_action :find_user, only: %i[edit update]

  def index
    @users = scoped_users
  end

  def edit; end

  def update
    @user.update(user_params)
    render 'edit'
  end

  private

  def scoped_users
    sort_by = params.fetch(:sort_by, 'email')
    sort_dir = params.fetch(:sort_dir, 'ASC')
    search_email = params.fetch(:search_email, nil)

    User.page(params[:page])
        .per(params[:per_page])
        .search_email(search_email)
        .order("#{sort_by} #{sort_dir}")
  end

  def ensure_admin
    authorize User, :admin?
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:admin)
  end
end
