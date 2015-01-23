require 'action_controller'

require "rails_conditional_params/version"
require "rails_conditional_params/patch"

module RailsConditionalParams
  ActionController::Parameters.include Patch
end
