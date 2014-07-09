class ClubGroup < ActiveRecord::Base
   validates :title, :presence => true
   has_many :posts 
   has_many :group_userships
   has_many :members , :through => :group_userships , :source => :user
   belongs_to :owner , :class_name => "User" , :foreign_key => :user_id
   after_create :join_owner_to_group

   def editable_by?(user)
      user && user == owner
   end

   def join_owner_to_group
      members << owner
   end


end
