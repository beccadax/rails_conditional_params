module RailsConditionalParams
  module PrependPatch
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
    def permit(*filters)
      RailsConditionalParams.restructure_filters! filters
      super(*filters)
    end
  end
end
