class CreateUrls < ActiveRecord::Migration
	def change 
		create_table :urls do |y|
			y.string :long_url
			y.string :shortened_url
			y.integer :click_count, default: 0
			y.string :error, default: "Invalid address format."
		end
	end
end

# t.integer :click_count, default: 0
# t.boolean :true, default: true