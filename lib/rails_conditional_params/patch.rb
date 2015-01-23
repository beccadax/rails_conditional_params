module RailsConditionalParams
  module Patch
    # Adds support for conditional params:
    # 
    #     params.permit(yes: true, no: false)
    #     # => { "yes" => "..." }
    # 
    # This is useful for parameters that should be permitted in some cases, 
    # but not others:
    # 
    #     params.permit(:title, :body, published: admin?)
    #     # Result only includes published if admin? is true.
    def permit_with_conditional_params(*filters)
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
    
      permit_without_conditional_params(*filters)
    end
  
    def Patch.included(other)
      other.alias_method_chain :permit, :conditional_params
    end
  end
end
