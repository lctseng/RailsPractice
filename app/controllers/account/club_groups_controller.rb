class Account::ClubGroupsController < ApplicationController
   before_action :login_required

   def index
      @groups = current_user.participated_groups

   end

   

end
