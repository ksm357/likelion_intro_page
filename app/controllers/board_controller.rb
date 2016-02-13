class BoardController < ApplicationController
  def list
       @post_list = Post.all.reverse
  end

  def write_post
    if request.method == "POST"
      @post = Post.create(
                          title: params[:title],
                          content: params[:content])
      redirect_to "/board/list"
    end
  end

  def detail
      @post = Post.find(params[:id])
  end
end
