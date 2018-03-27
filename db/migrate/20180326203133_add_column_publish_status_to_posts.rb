class AddColumnPublishStatusToPosts < ActiveRecord::Migration[5.1]
	def up
		add_column :posts, :publish_status, :integer, default: 1
	end

	def down
		remove_column :posts, :publish_status
	end
end