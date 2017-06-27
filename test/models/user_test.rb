# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid?' do
    assert User.new(Populate::User::USER_DEFAULTS.merge(email: 'test4321@test.com')).valid?
  end

  test 'invalid' do
    refute User.new(Populate::User::USER_DEFAULTS).valid?
  end

  test 'scope non_admin' do
    assert_equal 1, User.non_admin.count
  end

  test 'scope admin' do
    assert_equal 1, User.admin.count
  end

  test 'scope search_email' do
    assert_equal 1, User.search_email('test.user').count
  end
end
