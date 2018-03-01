class BaseController < ApplicationController
  before_action :authenticate_user!
  layout 'main_application'
end