# frozen_string_literal: true

if ENV.fetch('VILLAGE_SIMPLE_COV', 0).to_i == 1
  require 'simplecov'
  require 'simplecov-json'
  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::JSONFormatter,
  ])
  SimpleCov.start 'rails'
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'

module SignInHelper
  def sign_in(user:, password: 'test1234')
    post user_session_url(user: { email: user.email, password: password })
  end
end

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include SignInHelper
end

class PolicyTest < ActiveSupport::TestCase
  def permit(current_user, record, action)
    self.class.to_s.gsub(/Test/, '').constantize.new(current_user, record).public_send("#{action}?")
  end

  def forbid(current_user, record, action)
    !permit(current_user, record, action)
  end
end
