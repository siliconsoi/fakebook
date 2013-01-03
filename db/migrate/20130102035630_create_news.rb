class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :status
      t.references :user
      t.timestamps
    end
  end
end
