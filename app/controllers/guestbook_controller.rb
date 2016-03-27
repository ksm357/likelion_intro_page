class GuestbookController < ApplicationController
  def list
    if request.method == "GET"
      @guest_post_list = GuestPost.all.reverse
    else # request.method == "POST"
      if user_signed_in?
        @guest_post = GuestPost.create(
                            user_id: current_user.id,
                            name: current_user.name,
                            content: params[:content],
                            is_secret: params[:is_secret])
      else
        @guest_post = GuestPost.create(
                            name: params[:name],
                            encrypted_password: params[:password],
                            content: params[:content],
                            is_secret: params[:is_secret])
      end
      redirect_to "/guestbook/list"
    end
  end
end
