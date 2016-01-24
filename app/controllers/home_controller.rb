class HomeController < ApplicationController
  def index
  end
  
  def member
  end
  
  def board
       @post_list = Post.all.reverse
  end
  
  def write_post
   if request.method == "POST"
      @post = Post.create(
                          title: params[:title],
                          content: params[:content])
      redirect_to "/home/board"
    end
  end
end
