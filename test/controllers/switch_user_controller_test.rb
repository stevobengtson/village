# frozen_string_literal: true

require 'test_helper'

class SwitchUserControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in user: users(:admin)
  end

  test 'should switch user with create action' do
    post switch_user_index_url(id: users(:user))
    assert_response :redirect
  end

  test 'should switch back with destroy action' do
    post switch_user_index_url(id: users(:user))
    delete switch_user_url(users(:admin))
    assert_response :redirect
  end
end
