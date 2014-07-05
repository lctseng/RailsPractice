module EventsHelper
   def category_options
      Category.all.collect do |c|
         [c.name , c.id]
      end
   end

   def setup_event(event)
      event.build_location unless event.location
      event
   end

end
