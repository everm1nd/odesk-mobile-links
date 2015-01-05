class App < ActiveRecord::Base
	attr_reader :links

  has_many :markets

	validates_associated :markets

	def links=(links)
		@links = links
		@links.split( /\r?\n/ ).each do |string|
			markets.build(url: string)
		end
	end
end
