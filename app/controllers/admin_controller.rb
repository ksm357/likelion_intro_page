class AdminController < ApplicationController
  def user_list
    # url로 접근 제한
    if !(user_signed_in? && current_user.role == "admin")
      redirect_to '/'
    end
    @page_count = User.all.count/20 + 1;
    @user_list = User.order(id: :desc).page(params[:page]).per(20)
  end

  # 유저 정보 수정
  def user_modify
    selected_user = User.find(params[:user_id])
    selected_user.name = params[:user_name]
    selected_user.major = params[:user_major]
    selected_user.phone_number = params[:user_phonenumber]
    selected_user.role = params[:user_role]
    selected_user.introduction = params[:user_introduction]
    selected_user.save
    redirect_to :back
  end

  # 유저 삭제
  def user_delete
    selected_user = User.find(params[:user_id])
    selected_user.destroy
    redirect_to :back
  end
end
