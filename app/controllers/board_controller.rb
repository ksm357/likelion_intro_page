class BoardController < ApplicationController
  def list # 게시글 리스트
       @post_list = Post.all.reverse
  end

  def write_post # 게시글 작성
    if request.method == "POST"
      @post = Post.create(
                          title: params[:title],
                          content: params[:content])
      redirect_to "/board/list"
    end
  end

  def detail # 게시글 상세
      @post = Post.find(params[:id])
  end
end
