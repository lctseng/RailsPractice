class ClubGroupsController < ApplicationController
   before_filter :find_group , :only => [:edit,:update,:destroy]
   before_action :login_required, :only => [:new , :create , :edit , :update , :destroy]

   # Index
   def index
      @groups = ClubGroup.all
   end

   # Show
   def show
      @group = ClubGroup.find(params[:id])
      @posts = @group.posts
   end

   # New
   def new
      @group = ClubGroup.new
   end
   
   # Create
   def create
      @group = current_user.club_groups.build(group_params)
      if @group.save
         redirect_to club_groups_path
      else
         render :action => :new
      end
   end

   def edit
   end

   def update 
      if @group.update(group_params)
         redirect_to club_groups_path
      else
         render :action => :edit
      end
   end

   def destroy
      @group.destroy
      redirect_to club_groups_path
   end


   protected
   # before_filter：找到group
   def find_group
      @group = current_user.club_groups.find(params[:id])
   end
   # 經過permit的mass參數 
   def group_params(extra_allow = [])
     params.require(:club_group).permit([:title , :description] + extra_allow)
   end



end
