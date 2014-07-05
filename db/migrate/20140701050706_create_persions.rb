class CreatePersions < ActiveRecord::Migration
  def change
    create_table :persions do |t|
      t.string :name
      t.text :bio
      t.date :birthday

      t.timestamps
    end
  end
end
