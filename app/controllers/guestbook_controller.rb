class GuestbookController < ApplicationController
  def list
    if request.method == "GET"
      # @guest_post_list = GuestPost.all.reverse
      @page_count = GuestPost.all.count/10 + 1;
      @guest_post_list = GuestPost.order(id: :desc).page(params[:page]).per(10)
    else # request.method == "POST"
      if user_signed_in?
        @guest_post = GuestPost.create(
                            user_id: current_user.id,
                            name: current_user.name,
                            content: params[:content],
                            is_secret: params[:is_secret])
        @guest_post.save
      else
        @guest_post = GuestPost.create(
                            name: params[:name],
                            encrypted_password: params[:password],
                            content: params[:content],
                            is_secret: params[:is_secret])
        @guest_post.save
      end
      redirect_to "/guestbook/list"
    end
  end

  # 로그인 상태에서 수정 Action
  def modify_log_in
    guest_post = GuestPost.find(params[:guest_post_id])
    guest_post.content = params[:guest_post_content]
    guest_post.save
    redirect_to :back
  end

  # 로그아웃 상태에서 수정 Action
  def modify_not_log_in
    guest_post = GuestPost.find(params[:guest_post_id])
    if guest_post.encrypted_password == params[:guest_post_password]
      guest_post.name = params[:guest_post_name]
      guest_post.content = params[:guest_post_content]
      guest_post.save
    end
    redirect_to :back
  end

  # 로그인 상태에서 삭제 Action
  def delete_log_in
    guest_post = GuestPost.find(params[:guest_post_id])
    guest_post.destroy
    redirect_to :back
  end

  # 로그아웃 상태에서 삭제 Action
  def delete_not_log_in
    guest_post = GuestPost.find(params[:guest_post_id])
    if guest_post.encrypted_password == params[:guest_post_password]
      guest_post.destroy
    end
    redirect_to :back
  end

end
