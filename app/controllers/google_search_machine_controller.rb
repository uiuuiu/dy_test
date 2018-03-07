class GoogleSearchMachineController < BaseController
  def index

  end

  def upload
  	OpGoogleSearchMachine::UploadKeywordsFileOperation.run!(@data, params)
  	OpGoogleSearchMachine::SearchWithKeywordDataOperation.run!(@data)
  end

  private
  	def init_data_variable
  		@data = {user: current_user}
  	end
end