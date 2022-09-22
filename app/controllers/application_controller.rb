class ApplicationController < ActionController::API
  include Pagy::Backend
  before_action :force_json

  def force_json
    request.format = :json
  end
end
