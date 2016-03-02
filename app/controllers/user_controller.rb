class UserController < ApplicationController
  def email_duplication_check
    is_duplicate = true
    email = User.where(email: params[:email]).take
    if email.nil?
      is_duplicate = false
    end
    render :json => {:is_duplicate => is_duplicate}
  end
end
