# frozen_string_literal: true

require 'test_helper'

class ApplicationPolicyTest < PolicyTest
  test 'index?' do
    refute permit(users(:user), User.new, :index)
  end

  test 'show?' do
    refute permit(users(:user), User.new, :show)
  end

  test 'create?' do
    refute permit(users(:user), User.new, :create)
  end

  test 'new?' do
    refute permit(users(:user), User.new, :new)
  end

  test 'update?' do
    refute permit(users(:user), User.new, :update)
  end

  test 'edit?' do
    refute permit(users(:user), User.new, :edit)
  end

  test 'destroy?' do
    refute permit(users(:user), User.new, :destroy)
  end
end
