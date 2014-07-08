class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :club_group_id

      t.timestamps
    end
  end
end
