# frozen_string_literal: true

require 'faker'

module Populate::User
  USER_DEFAULTS = {
    password: 'test1234',
    password_confirmation: 'test1234',
    confirmed_at: 1.day.ago,
    confirmation_sent_at: 2.days.ago,
    last_sign_in_at: 1.day.ago,
    last_sign_in_ip: '127.0.0.1',
    admin: false
  }.freeze

  class << self
    def run(options = {})
      email = options.delete(:email)
      raise ArgumentError, 'Email address required to create user' unless email
      ::User.create_with(USER_DEFAULTS.merge(options))
            .find_or_create_by(email: email)
    end

    def run_many(count = 10)
      raise ArgumentError, 'Creating more than 1000 users can cause performance issues' if count > 1000
      (1..count).each do |index|
        email = Faker::Internet.email
        user = run(email: email)
        yield(index: index, email: email, success: user.present?)
      end
    end
  end
end
