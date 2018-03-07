## GET CSV DATA FOR GOOGLE SEARCHING
#
module OpGoogleSearchMachine
	class UploadKeywordsFileOperation
		extend BaseOperation
		extend ActiveSupport::Concern

		def self.run!(data, params={})
			super
			get_keywords_file_data
		end

		## Operation layer actions
		class << self
			def get_keywords_file_data
				@data[:csv_data] = Roo::Spreadsheet.open(@params[:keywords_file].path)
			end
		end
	end
end