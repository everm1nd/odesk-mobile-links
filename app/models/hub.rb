class Hub < ActiveRecord::Base
	attr_accessor :links

  has_many :links
end
