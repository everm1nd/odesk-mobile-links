class App < ActiveRecord::Base
	attr_reader :links

  has_many :markets

	validates :hashid,  presence: true,
											uniqueness: true,
											format: /[a-zA-Z0-9\_\-]+/,
											if: :persisted?
	validates_presence_of :links
	validates_associated :markets

	after_save  :hashify

	def links=(links)
		@links = links
		@links.split( /\r?\n/ ).map(&:strip).each do |string|
			markets.build(url: string)
		end
	end

	def shortlink
		"#{App.shorthost}/#{hashid}"
	end

	private
	def hashify
		update_column(:hashid, Hashids.new(hash_salt).encode(self.id)) unless hashid
	end

	def hash_salt
		"whatever"
	end

	def self.shorthost
		'http://limitless-plains-9114.herokuapp.com/a'
	end
end
