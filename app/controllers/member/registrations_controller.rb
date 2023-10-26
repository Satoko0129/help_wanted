# frozen_string_literal: true

class Member::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    #@admin = Admin.find_by(invitation_code: params[:invitation_code])
    #member = Member.find_or_create_by!(nickname: params[:member][:nickname], admin: @admin) do |member|
    #   member.password = SecureRandom.urlsafe_base64
    #   #member.email = SecureRandom.urlsafe_base64+"@example.com"
    #   member.birthday = "#{params[:member]['birthday(1i)']}/#{params[:member]['birthday(2i)']}/#{params[:member]['birthday(3i)']}"
    # end
    # sign_in member
    # redirect_to root_path
     super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    #binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :admin_invitation_code])
  end

#  def configure_permitted_parameters
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday])
#  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
