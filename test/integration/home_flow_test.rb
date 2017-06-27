# frozen_string_literal: true

require 'test_helper'

class HomeFlowTest < ActionDispatch::IntegrationTest
  test 'can see the home page' do
    get root_path
    assert_select 'h1', 'Welcome to the Village'
  end
end
