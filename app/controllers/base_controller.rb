class BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :init_data_variable
  layout 'main_application'

  private
  def init_data_variable
  	@data = {}
  end
end