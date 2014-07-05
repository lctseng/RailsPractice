class Admin::EventsController < ApplicationController
   before_filter :authenticate
   layout "admin"

   def index

   end

   protected

   def authenticate
      @user_name = "N/A"
      authenticate_or_request_with_http_basic do |user_name,password|
         @user_name = user_name
         user_name == 'admin' && password == 'admin'
      end
   end


end
