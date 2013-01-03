class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.text :body
      t.references :news

      t.timestamps
    end

    add_index :comments, :news_id
  end
end
