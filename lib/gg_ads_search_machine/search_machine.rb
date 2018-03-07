require 'nokogiri'
require 'open-uri'

module GgAdsSearchMachine
	class SearchMachine

		DOMAIN_ADDRESS = 'https://google.com/search'

		attr_accessor :keyword

		def initialize(word)
			@keyword = word
		end

		def search
			doc = Nokogiri::HTML(open(DOMAIN_ADDRESS + "?q=#{keyword}"))
			# result_search_tags = doc.css("li.ads-ad")
			ads_at_top_tags = doc.css('div._Ak#_Ltg ol li.ads-ad')
			ads_at_bot_tags = doc.css('div._Ak#_Ktg ol li.ads-ad')
			non_ads_tags = doc.css('div#res div#search div#ires ol div.g')

			GgAdsSearchMachine::SearchMachineResult.new(
				doc: doc,
				ads_at_top_tags: ads_at_top_tags,
				ads_at_bot_tags: ads_at_bot_tags,
				non_ads_tags: non_ads_tags
			)
		end
	end
end