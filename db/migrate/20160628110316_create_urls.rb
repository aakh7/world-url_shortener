class CreateUrls < ActiveRecord::Migration
	def change 
		create_table :urls do |y|
			y.string :long_url
			y.string :shortened_url
		end
	end
end
