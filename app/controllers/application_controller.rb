class ApplicationController < ActionController::API
  def rend(options={})
    options[:json] = serializer.new(options[:json])
    super(options)
  end
end
