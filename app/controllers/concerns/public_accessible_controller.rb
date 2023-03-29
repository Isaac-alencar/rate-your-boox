# frozen_string_literal: true

# skip authentication for a controller
module PublicAccessibleController
  extend ActiveSupport::Concern

  included do
    skip_before_action :authenticate_user!
  end
end
