# frozen_string_literal: true

# rubocop:disable Rails/Output

user_defaults = {
  password: 'test1234',
  password_confirmation: 'test1234',
  confirmed_at: 1.day.ago,
  confirmation_sent_at: 2.days.ago,
  last_sign_in_at: 1.day.ago,
  last_sign_in_ip: '127.0.0.1',
  admin: false
}

puts 'Creating users'.green
User.destroy_all
User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
User.create!([
               user_defaults.merge(email: 'test.user@village.com'),
               user_defaults.merge(email: 'test.admin@village.com', admin: true),
               user_defaults.merge(email: 'test.developer@village.com')
             ])

puts 'Database reset'.green

# rubocop:enable Rails/Output
