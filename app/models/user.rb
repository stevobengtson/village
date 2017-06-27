# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  validates :email, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  scope :non_admin, -> { where(admin: false) }
  scope :admin, -> { where(admin: true) }
  scope :search_email, ->(email) { where('users.email LIKE ?', "#{email}%") if email.present? }
end
