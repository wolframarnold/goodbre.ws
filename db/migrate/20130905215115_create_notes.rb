class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id, null: false
      t.integer :beer_id, null: false
      t.text :text

      t.timestamps
    end

    add_index :notes, [:user_id, :beer_id], unique: true
  end
end
