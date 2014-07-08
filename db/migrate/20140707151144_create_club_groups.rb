class CreateClubGroups < ActiveRecord::Migration
  def change
    create_table :club_groups do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
