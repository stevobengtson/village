# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'should determine if current user admin?' do
    ApplicationHelperTest.any_instance.expects(:current_user).returns(users(:admin))
    assert admin?
  end

  test 'should determine if active_controller?' do
    ApplicationHelperTest.any_instance.stubs(:params).returns(controller: 'admin')
    assert active_controller?('admin')
    refute active_controller?('test')
    refute active_controller?('admin/test')

    ApplicationHelperTest.any_instance.stubs(:params).returns(controller: 'admin/user')
    assert active_controller?('admin')
    assert active_controller?('admin/user')
    refute active_controller?('bad/user')
    refute active_controller?('bad/foo')
    refute active_controller?('test')
  end

  test 'should return navigation link' do
    ApplicationHelperTest.any_instance.stubs(:params).returns(controller: 'admin')
    assert_dom_equal(%(<li class="active">Test</li>), nav_link('admin') { 'Test' })
    assert_dom_equal(%(<li>Test</li>), nav_link('test') { 'Test' })

    ApplicationHelperTest.any_instance.stubs(:params).returns(controller: 'admin/user')
    assert_dom_equal(%(<li class="active">Test</li>), nav_link('admin') { 'Test' })
    assert_dom_equal(%(<li class="active">Test</li>), nav_link('admin/user') { 'Test' })
    assert_dom_equal(%(<li>Test</li>), nav_link('test/user') { 'Test' })
  end

  test 'should return a row index' do
    assert_equal 1, row_index(0)
    assert_equal 10, row_index(9)

    ApplicationHelperTest.any_instance.stubs(:params).returns(page: 1, per_page: 25)
    assert_equal 1, row_index(0)
    assert_equal 10, row_index(9)

    ApplicationHelperTest.any_instance.stubs(:params).returns(page: 5, per_page: 10)
    assert_equal 41, row_index(0)
    assert_equal 50, row_index(9)
  end
end
