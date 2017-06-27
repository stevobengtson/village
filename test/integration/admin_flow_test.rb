# frozen_string_literal: true

require 'test_helper'

class AdminFlowTest < ActionDispatch::IntegrationTest
  def setup
    sign_in user: users(:admin)
  end

  test 'changing a user to admin' do
    get admin_index_url
    assert_response :success
    assert_select 'a', 'Users'

    get edit_admin_user_url(users(:user))
    assert_response :success
    assert_select 'label', 'Email'

    put admin_user_url(users(:user)), params: { user: { admin: '1' } }
    assert_response :success
    assert_select 'label', 'Email'
  end
end
