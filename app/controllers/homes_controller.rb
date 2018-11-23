class HomesController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
  
  def index2
     @posts= Post.all
     @users= User.all
      
      @post_1 = Post.where(category:1)
      @post_2 = Post.where(category:2)
      @post_3 = Post.where(category:3)
      #@post_4 = Post.where(category:4)
      #@post_5 = Post.where(category:5)
      #@post_6 = Post.where(category:6)
      #@post_7 = Post.where(category:7)
      
      if current_user.nil?
      else
      @post = Post.where(:user_id => current_user.id)
      end
      
      # if current_user.nil?
      # else
      # @sorted_post= Post.with_lat_nearest_to(current_user.lat)
      # end
  end
  
  
   def show
      #@user= current_user.address
      
       @post = Post.find(params[:id])
       respond_to do |format|
       format.js
       end
    end
end


      