# frozen_string_literal: true

require 'test_helper'

class SwitchUserHelperTest < ActionView::TestCase
  test 'should get switched user' do
    SwitchUserHelperTest.any_instance.expects(:session).returns(original_user_id: users(:user).id)
    assert switched_user?

    SwitchUserHelperTest.any_instance.expects(:session).returns({})
    refute switched_user?
  end

  test 'should get the original user' do
    SwitchUserHelperTest.any_instance.expects(:session).returns({})
    SwitchUserHelperTest.any_instance.expects(:current_user).returns(users(:admin))
    assert_equal users(:admin), original_user

    SwitchUserHelperTest.any_instance.expects(:session).twice.returns(original_user_id: users(:user).id)
    assert_equal users(:user), original_user
  end
end
