# frozen_string_literal: true

require 'test_helper'

class Admin::UserControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in user: users(:admin)
  end

  test 'should get index' do
    get admin_user_index_url
    assert_response :success
  end

  test 'should get edit page' do
    get edit_admin_user_url(users(:user))
    assert_response :success
  end

  test 'should update admin state' do
    assert_difference('User.admin.count') do
      put admin_user_url(users(:user)), params: { user: { admin: '1' } }
      assert_response :success
    end
  end
end
