class AddPostsCountToClubGroup < ActiveRecord::Migration
  def change
     add_column :club_groups, :posts_count, :integer , :default => 0
  end
end
