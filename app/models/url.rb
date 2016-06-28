class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :long_url, uniqueness:true
	

	def self.shorten
		([*('A,'..'Z'),*('0'..'9')]).sample(8).join
	end
end

