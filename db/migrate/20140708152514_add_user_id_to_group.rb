class AddUserIdToGroup < ActiveRecord::Migration
  def change
     add_column :club_groups , :user_id , :integer
  end
end
