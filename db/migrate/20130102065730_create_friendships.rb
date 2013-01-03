class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer    :friend_id
      t.references :user
      t.timestamps
    end

  # add_index :friendships, :friend_id, :unique => true
  end
end
