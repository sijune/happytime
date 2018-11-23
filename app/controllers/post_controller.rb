class PostController < ApplicationController
  #before_action :authenticate_user!, except: [:index]
    respond_to :js, :json, :html
   
   def log_in
      unless user_signed_in?
        redirect_to "/users/sign_in"
      end
   end
  
  
    def index
       
      @posts= Post.all
      @users= User.all
      
      @post_1 = Post.where(category:1)  #카페
      @post_2 = Post.where(category:2)  #음식점
      @post_3 = Post.where(category:3)   #주점
      @post_4 = Post.where(category:4)   #마트
      #@post_5 = Post.where(category:5)
      #@post_6 = Post.where(category:6)
      #@post_7 = Post.where(category:7)
      #@price= Post.order(price: :asc)
    
    #   @point = params[:pp]
    #   puts "@@@@@@@@@@"
    # #   puts @point
    #   puts "#####233322#"
    #   render json: @point
    #   respond_with @point
       #@sorted_post_2= @sorted_post.group_by{|t| t.lng}
       
       #@plans = Plan.order("price")

      #@files= @user.files.order("id DESC").all
      #@dates = @files.group_by { |t| t.created_at }
        
      if current_user.nil?
      else
        @post = Post.where(:user_id => current_user.id)
      end
      
       if current_user.nil?
       #@mart_4= Post.with_lng_nearest_to(@point)
          @posts= Post.all
        else
           @sorted_post = Post.with_lat_nearest_to(current_user.lat, current_user.lng)
           #Post.find_by(user_id: self.id).present?
           #@price= Post.lowest(current_user.lat, current_user.lng)
           @price= Post.order("abs(lat - #{current_user.lat})")
           @price2= @price.order("abs(lat - #{current_user.lng})")
           @price_3= @price2.order("CAST(price as FLOAT) ASC")
           
           @cafe= @post_1.order("abs(lat - #{current_user.lat})")
           @cafe_2= @cafe.order("abs(lat - #{current_user.lng})")
           @cafe_3= @cafe_2.order("CAST(price as FLOAT) ASC")
           
           @res = @post_2.order("abs(lat - #{current_user.lat})")
           @res_2= @res.order("abs(lat - #{current_user.lng})")
           @res_3= @res_2.order("CAST(price as FLOAT) ASC")
           
           @bar= @post_3.order("abs(lat - #{current_user.lat})")
           @bar_2= @bar.order("abs(lat - #{current_user.lng})")
           @bar_3= @bar_2.order("CAST(price as FLOAT) ASC")
           
           @mart= @post_4.order("abs(lat - #{current_user.lat})")
           @mart_2= @mart.order("abs(lat - #{current_user.lng})")
           @mart_3= @mart_2.order("CAST(price as FLOAT) ASC")
        end
       
    end
  
  
  
  
  
    def new
       @post = Post.new
       @user= current_user.address
      @post.user_id = current_user.id
    end
  
  
  
  
  #@hot_post =Post.joins("LEFT OUTER JOIN Likes ON likes.post_id = posts.id").group("posts.id").order("COUNT(likes.id) DESC")
  
  
  
    def create
     
        
      uploader = ImageUploader.new
      uploader.store!(params[:image])
      
      @post = Post.new #(post_params)
      @post.title = params[:input_title]
      @post.time = params[:input_time]
      @post.content = params[:input_content]
      @post.username = params[:input_username]
      
      @post.start_date = params[:year]+ " " + params[:month]+ " " + params[:day]+ " " + params[:start_hour]+ " " +params[:start_minute] 
      @post.end_date = params[:year]+ " " + params[:month]+ " " + params[:day]+ " " + params[:end_hour]+ " " +params[:end_minute] 
       # @post.year = params[:year]
      # @post.month = params[:month]
      # @post.day = params[:day]
      # @post.hour = params[:hour]
      # @post.minute = params[:minute]
      
      @post.image= uploader.url
      @post.lat= params[:input_lat]
      @post.lng= params[:input_lng]
      @post.thumb = uploader.thumb.url
      @post.user_id = current_user.id
      @post.category= params[:input_category]
      @post.address = params[:input_address]
      @post.price =params[:input_price]
      # @post.sale_hour= params[:sale_hour]
      # @post.sale_minutes =params[:sale_minutes]
      # @post.sale_hour_2= params[:sale_hour_2]
      # @post.sale_minutes_2 =params[:sale_minutes_2]

      
  
        if @post.save
          redirect_to '/'
          #format.json { render :show, status: :created, location: @post }
        end
    end
      
    #def map
      #@user= current_user.address
    #end    
      
  
    def update
      
    end
  
    def show
      #@user= current_user.address
      
       @post = Post.find(params[:id])
       respond_to do |format|
       format.js
       end
    end
  
    def edit
      @post = Post.new
       @user= current_user.address
      @post.user_id = current_user.id
    end
  
    def destroy
      @post = Post.find(params[:id])
    
     if current_user.id == @post.user_id
      @post.destroy
      redirect_to "/post"
     else
      redirect_to "/post"
     end
    end
    
    
    
    def user_info
      @user = User.find(params[:id])
      
      @post = Post.where(:user_id => params[:id])
      
      #@comment = Comment.where(:user_id => params[:id])
      
      #@like = Like.where(:user_id => params[:id])
    end
    
    
  
      
     #private
      # Use callbacks to share common setup or constraints between actions.
      #def set_post
        #@post = Post.find(params[:id])
      #end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      #def post_params
        #params.require(:post).permit(:input_title, :input_time, :input_content, :input_lat, :input_lng)
      #end
end


