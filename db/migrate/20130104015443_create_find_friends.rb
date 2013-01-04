class CreateFindFriends < ActiveRecord::Migration
  def change
    create_table :find_friends do |t|

      t.timestamps
    end
  end
end
