class SearchResult < ApplicationRecord

	has_many :adswords, dependent: :destroy
	has_many :non_adswords, dependent: :destroy
end
