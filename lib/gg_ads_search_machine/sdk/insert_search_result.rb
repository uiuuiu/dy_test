module GgAdsSearchMachine
	module Sdk
		class InsertSearchResult
			attr_accessor :keyword_obj, :search_result
			def initialize(keyword_obj, search_result)
				@keyword_obj 		= keyword_obj
				@search_result 	= search_result
			end

			def start
				keyword_obj.search_results.create(
					total_top_ads: calculate_total_top_ads,
					total_bot_ads: calculate_total_bot_ads,
					total_ads: calculate_total_ads,
					total_non_ads: calculate_non_ads,
					total_number_of_links: calculate_total_number_of_links,
					total_of_search_results: calculate_total_of_search_results,
					html_content: get_html_content,
					)
			end

			def calculate_total_top_ads
				@search_result.ads_at_top_tags.count
			end

			def calculate_total_bot_ads
				@search_result.ads_at_bot_tags.count
			end

			def calculate_total_ads
				calculate_total_top_ads + calculate_total_bot_ads
			end

			def calculate_non_ads
				@search_result.non_ads_tags.count
			end
			
			def calculate_total_number_of_links
				1
			end

			def calculate_total_of_search_results
				1
			end
			
			def get_html_content
				"abc"
			end
		end
	end
end