# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    authorize User, :admin?
  end
end
