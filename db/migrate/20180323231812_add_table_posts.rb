class AddTablePosts < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
  		t.integer 		:author_id
  		t.string			:title
  		t.text				:markdown_text
  		t.text 				:converted_text
  		t.timestamps
  	end
  end
end
