# frozen_string_literal: true

require 'test_helper'

class Populate::UserTest < ActiveSupport::TestCase
  test '#run' do
    assert_difference('User.count') do
      Populate::User.run(email: 'user1234@test.com')
    end
  end

  test '#run_many' do
    assert_difference('User.count', 2) do
      Populate::User.run_many(2) do |user|
        assert user[:success]
      end
    end
  end
end
