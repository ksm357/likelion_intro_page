class GuestbookController < ApplicationController
  def list
    if request.method == "GET"
      @guest_post_list = GuestPost.all.reverse
    else # request.method == "POST"
      @guest_post = GuestPost.create(
                          name: params[:name],
                          encrypted_password: params[:password],
                          content: params[:content],
                          is_secret: params[:is_secret])
      redirect_to "/guestbook/list"
    end
  end
end
