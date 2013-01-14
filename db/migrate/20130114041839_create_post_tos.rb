class CreatePostTos < ActiveRecord::Migration
  def change
    create_table :post_tos do |t|
      t.text :message
      t.integer :friend_id
      t.references :user

      t.timestamps
    end
  end
end
