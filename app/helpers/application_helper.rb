# frozen_string_literal: true

module ApplicationHelper
  def admin?
    current_user.try(:admin?)
  end

  def active_controller?(controller_name)
    params[:controller] == controller_name ||
      params[:controller].split('/').first == controller_name
  end

  def nav_link(controller_name)
    li_class = 'active' if active_controller?(controller_name)
    content_tag(:li, class: li_class) { yield if block_given? }
  end

  def row_index(index = 0)
    (params.fetch(:page, 1).to_i - 1) * params.fetch(:per_page, 25).to_i + (index + 1)
  end
end
