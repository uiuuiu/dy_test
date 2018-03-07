module OpGoogleSearchMachine
	class SearchWithKeywordDataOperation
		extend BaseOperation
		extend ActiveSupport::Concern

		def self.run!(data, params={})
			super
			search_with_csv_data
		end

		## Operation layer actions
		class << self

			def search_with_csv_data
				@data[:csv_data].each do |keyword|
					keyword_obj = Keyword.find_or_create_by(name: keyword.first, user_id: @data[:user].id)
					search_machine = GgAdsSearchMachine::SearchMachine.new(keyword_obj.name)
					search_result = search_machine.search

					insert_search_result_to_db(keyword_obj, search_result)
				end
			end

			def insert_search_result_to_db(keyword_obj, search_result)
				search_result.insert_to_db(keyword_obj)
			end
		end
	end
end