require 'action_controller'

require "rails_conditional_params/version"
require "rails_conditional_params/alias_patch"
require "rails_conditional_params/prepend_patch"

module RailsConditionalParams
  if ActionController::Parameters.respond_to? :prepend
    ActionController::Parameters.prepend PrependPatch
  else
    ActionController::Parameters.include AliasPatch
  end
  
  def RailsConditionalParams.restructure_filters!(filters)
    filters.each do |filter|
      if filter.is_a? Hash
        filter.delete_if do |key, value|
          case value
          when TrueClass
            filters << key
            true
          when FalseClass, NilClass
            # do nothing
            true
          else
            false
          end
        end
      end
    end
  end
end
