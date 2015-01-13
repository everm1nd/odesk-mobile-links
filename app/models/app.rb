class App < ActiveRecord::Base
	attr_reader :links

  has_many :markets

	validates :hashid,  presence: true,
											uniqueness: true,
											format: /[a-zA-Z0-9\_\-]+/,
											if: :persisted?
	validates_presence_of :links, unless: :persisted?
	validates_associated :markets
	validate :unique_links, if: :links

	after_save  :hashify

	def links=(links)
		@links = links
		links_list.each do |string|
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
		'http://apptoolshq.com/crossplatformlink/a'
	end

	def links_list
		@links.split( /\r?\n/ ).map(&:strip)
	end

	def unique_links
		errors.add(:links, "you have duplicate links") unless links_list.uniq == links_list
	end
end
