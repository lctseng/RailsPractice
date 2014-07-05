#encoding:utf-8
class EventsController < ApplicationController
   
   before_filter :find_event , :only => [:show,:edit,:update,:destroy]
   
   
   # 進入主網頁時，讀取所有資料
   def index
      sort_by = (params[:order] == 'name') ? 'name' : 'created_at'
      @events = Event.order(sort_by).page(params[:page]).per(5)

      respond_to do |format|
         #debugger
         format.html # index.html.erb
         format.xml { render :xml => @events.to_xml }
         format.json { render :json => @events.to_json }
         format.atom { @feed_title = "My event list"} # index.atom.builder
      
      end

   end
   # 新增資料的處理
   def new
      @event = Event.new
      @groups = Group.all
      3.times do 
         question = @event.questions.build 
         4.times do 
            question.answers.build
         end
      end
   end
   # 處理創立資料
   def create
      @event = Event.new(new_params)
      @groups = Group.all
      if @event.save
         redirect_to events_url
         flash[:notice] = "event was successfully created"
      else
         render :action => 'new'
      end

   end
   # 顯示個別資料 
   def show
      @groups = Group.all
      respond_to do |format|
         format.html {@page_title = "showing:#{@event.name}"}
         format.xml # show.xml.builder
         format.json {render :json => { id: @event.id , name: @event.name }.to_json }
      end
   end
   # 編輯資料 
   def edit
      @groups = Group.all
   end
   # 更新資料
   def update
      if @event.update(new_params)
         redirect_to event_url(@event)
         flash[:notice] = "update successfully!"
      else
         render :action => :edit
      end
   end
   # 刪除資料
   def destroy
      @event.destroy
      flash[:alert] = "delete successfully!"
      redirect_to events_url
   end


   def search
      @events = Event.where( 
                              ["name like ?","%#{params[:keyword]}%"]
                           ).page(params[:page] ).per(5)
      render :action => :index
   end

   def dashboard
      @event = Event.find(params[:id])
   end

   protected
   
   # 尋找事件
   def find_event
      @event = Event.find(params[:id])
   end

   # 新進資料先行處理
   def new_params
      params.require(:event).permit(:name,:description,:category_id, :group_ids => [], :location_attributes => [:id , :name , :event_id , :_destroy] ,:questions_attributes => [:id,:event_id,:content,:_destroy , :answers_attributes =>[ :id , :question_id , :content  , :_destroy] ])
   end
end
