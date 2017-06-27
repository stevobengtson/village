# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def admin?
    @user.try(:admin?)
  end
end
