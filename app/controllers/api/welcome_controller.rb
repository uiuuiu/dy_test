class Api::WelcomeController < Api::BaseApiController

  def index
    render json: {name: 'dy'}
  end
end