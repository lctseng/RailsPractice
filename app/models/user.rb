class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :club_groups 
  has_many :posts 
  has_many :group_userships
  has_many :participated_groups, :through => :group_userships , :source => :club_group

  # extend OmniauthCallbacks
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def join!(group)
      participated_groups << group
  end

  def quit!(group)
      participated_groups.delete(group)
  end

  def is_member_of?(group)
      participated_groups.include?(group)
  end


end
