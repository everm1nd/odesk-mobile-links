class App < ActiveRecord::Base
	require 'digest/md5'

	attr_reader :links

  has_many :markets

	validates :hashid, presence: true, uniqueness: true, if: :persisted?
	validates_associated :markets

	after_save :hashify

	def links=(links)
		@links = links
		@links.split( /\r?\n/ ).each do |string|
			markets.build(url: string)
		end
	end

	def shortlink
		"#{App.shorthost}/#{hashid}"
	end

	private
	def hashify
		update_column(:hashid, Digest::MD5.hexdigest(hash_salt + self.id.to_s)) unless hashid
	end

	def hash_salt
		"whatever"
	end

	def self.shorthost
		'http://appme.io'
	end
end
