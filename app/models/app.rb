class App < ActiveRecord::Base
	attr_reader :links

  has_many :markets

	validates_associated :markets

	def links=(lines)
		strings = lines.split( /\r?\n/ )
		strings.each do |string|
			markets.build(url: string)
		end
	end
end
