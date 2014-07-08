class Post < ActiveRecord::Base
   belongs_to :club_group
   validates :content , :presence => true
end
