# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  layout 'admin_application'
  #before_action :configure_permitted_parameters, only: [:create]
  def guest_sign_in
    admin = Admin.guest
    sign_in admin
    redirect_to root_path, notice: 'ゲストアドミンとしてログインしました。'
  end

  protected
  def after_sign_in_path_for(resource)
    admin_root_path
  end

  def after_sign_out_path_for(resource)
    admin_session_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

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
