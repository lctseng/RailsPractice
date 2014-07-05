#encoding:utf-8
class Event < ActiveRecord::Base
   validates_presence_of :name
   has_one :location
   has_many :attendees
   has_many :questions , :dependent => :destroy
   belongs_to :category
   has_many :event_groupships
   has_many :groups , :through => :event_groupships
   delegate :name, :to => :category , :prefix => true , :allow_nil => true
   accepts_nested_attributes_for :questions , :reject_if => lambda { |a| a[:content].blank?  } , :allow_destroy => true
   accepts_nested_attributes_for :location , :allow_destroy => true , :reject_if => :all_blank

   #def category_name
   #   self.category.nil? ? "沒有所屬的類別" : self.category.name 
   #end
   
   alias category_name_old category_name
   def category_name
      old = category_name_old
      old.nil? ? "沒有設定Category" : old
   end

   def closed?
      self.status == "CLOSED"
   end

   def open?
      !self.closed?
   end

   def open!
      self.status = "OPEN"
      self.save!
   end

   def close!
      self.status = "CLOSED"
      self.save!
   end


end
