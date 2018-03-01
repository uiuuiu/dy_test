class Api::BaseApiController < ActionController::API
  before_action :doorkeeper_authorize!

  def doorkeeper_unauthorized_render_options(error: nil)
    { json: { error: "Not authorized" } }
  end
end