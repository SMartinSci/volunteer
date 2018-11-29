class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :location
      t.string :date
      t.string :description
      t.integer :user_id
      t.timestamps
    end
  end
end