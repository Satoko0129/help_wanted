# frozen_string_literal: true

class Member::SessionsController < Devise::SessionsController
  #before_action :configure_permitted_parameters, if: :devise_controller?

#  protected

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to root_path, notice: 'ゲストメンバーとしてログインしました。'
  end

  def create
    birth_day = "#{params[:member]['birthday(1i)']}/#{params[:member]['birthday(2i)']}/#{params[:member]['birthday(3i)']}"
    member = Member.find_by(nickname: params[:member][:nickname], birthday: birth_day)
    if member != nil
      sign_in member
      redirect_to root_path
    else
      redirect_to new_member_session_path, alert: "なまえかたんじょうびが、まちがっています"
    end
  #   super
  end

  #

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
