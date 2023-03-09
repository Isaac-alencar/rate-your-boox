# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || user_path(current_user.id)
  end
end
