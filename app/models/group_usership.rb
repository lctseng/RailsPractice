class GroupUsership < ActiveRecord::Base
   belongs_to :club_group 
   belongs_to :user
end
