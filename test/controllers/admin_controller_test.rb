# frozen_string_literal: true

require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in user: users(:admin)
  end

  test 'should get index' do
    get admin_index_url
    assert_response :success
  end
end
