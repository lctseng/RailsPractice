class PostsController < ApplicationController
   before_filter :find_group 
   before_filter :find_post , :only => [:edit,:update,:destroy]
   before_action :login_required , :only => [:new , :create , :edit , :update , :destroy]

   def edit
      @page_title = "Edit Post"
   end

   def update
      if @post.update(post_params)
         redirect_to club_group_path(@group)
      else
         render :action => :edit
      end

   end

   def destroy
      @post.destroy
      redirect_to club_group_path(@group)
   end

   def new
      @page_title = "New PoST"
      @post = @group.posts.build
   end

   def create
      @post = @group.posts.new(post_params)
      @post.author = current_user
      if @post.save
         redirect_to club_group_path(@group)
      else
         render :new
      end
   end

   protected
   def find_group
      @group = ClubGroup.find(params[:club_group_id])
   end

   def find_post
      @post = current_user.posts.find(params[:id])
   end

   def post_params(extra_allow=[])
      params.require(:post).permit([:content,:club_group_id] + extra_allow)
   end

end
