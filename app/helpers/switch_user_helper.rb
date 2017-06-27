# frozen_string_literal: true

module SwitchUserHelper
  def switched_user?
    session.key?(:original_user_id)
  end

  def original_user
    session[:original_user_id] ? User.find_by(id: session[:original_user_id]) : current_user
  end
end
