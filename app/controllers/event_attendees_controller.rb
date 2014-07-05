#encoding:utf-8
class EventAttendeesController < ApplicationController
   
   before_filter :find_event 

   def index
      @attendees = @event.attendees
   end

   def show
      @attendee = @event.attendees.find(params[:id])
   end

   def new
      @attendee = @event.attendees.build
   end

   def create
      @attendee = @event.attendees.build(new_params)
      if @attendee.save
         redirect_to event_attendees_url(@event)
      else
         render :action => :new
      end
   end

   
   def edit
      @attendee = @event.attendees.find(params[:id])
   end

   def update
      @attendee = @event.attendees.find(params[:id])

      if @attendee.update(new_params)
         redirect_to event_attendees_url(@event)
      else
         render :action => :new
      end
   end

   def destroy
      @attendee = @event.attendees.find(params[:id])
      @attendee.destroy

      redirect_to event_attendees_url(@event)

   end




   protected
   # 新進資料先行處理
   def new_params
      params.require(:attendee).permit(:name,:event_id)
   end

   def find_event
      @event = Event.find(params[:event_id])
   end


end
