module GgAdsSearchMachine
	class SearchMachineResult
		include ActiveRecord::AttributeAssignment

		attr_accessor :doc, # HTML content
									:ads_at_top_tags,
									:ads_at_bot_tags,
									:non_ads_tags

		def initialize(arg)
			assign_attributes(arg)
		end

		def insert_to_db(keyword_obj)
			GgAdsSearchMachine::Sdk::InsertSearchResult.new(keyword_obj, self).start
		end

	end
end
