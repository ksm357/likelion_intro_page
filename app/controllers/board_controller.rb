class BoardController < ApplicationController
  def list # 게시글 리스트
       @post_list = Post.all.reverse
  end

  def write_post # 게시글 작성
    if !(user_signed_in? && current_user.role == "admin")
      redirect_to '/'
    end
    if request.method == "POST"
      @post = Post.create(
                          board_id: params[:id],
                          title: params[:title],
                          content: params[:content],
                          hits: 0)
      redirect_to "/board/list"
    end
  end

  def detail # 게시글 상세
      @post = Post.find(params[:id])
      @post.hits += 1
      @post.save
  end
end
