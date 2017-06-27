# frozen_string_literal: true

require 'test_helper'

class UserPolicyTest < PolicyTest
  test 'permit admin' do
    assert permit(users(:admin), User.new, :admin)
  end

  test 'forbid non admin' do
    assert forbid(users(:user), User.new, :admin)
  end
end
