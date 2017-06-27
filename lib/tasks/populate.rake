# frozen_string_literal: true

require 'faker'
require 'colorize'

namespace :populate do
  desc 'Populate random users'
  task :users, [:count] => :environment do |_task, args|
    args.with_defaults(count: '10')
    count = args[:count].to_i

    puts "Creating #{count} users..."
    Populate::User.run_many(count) do |user|
      puts("[#{user[:index]}] Created user with email #{user[:email]}".green) if user[:success]
      puts("[#{user[:index]}] Unable to create user with email #{user[:email]}".red) unless user[:success]
    end
  end
end
