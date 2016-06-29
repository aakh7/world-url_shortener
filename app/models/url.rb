require 'uri'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :long_url, format: {with: /(http[s]?\:\/\/|w{3}\.)/, message:"Invalid URL format. Please enter a valid URL."}, presence: true

	def self.valid?
		!!URI.parse
		uri.kind_of?(URI::HTTP)
	rescue URI::InvalidURIError
	  false
	end

	def self.shorten
		([*('A'..'Z'),*('0'..'9')] - %w(0 1 O I)).sample(8).join
	end
end

