class Admin::MembersController < ApplicationController
  layout 'admin_application'
  
  def index
    @members = Member.all
  end
  
  def show
    @member = Member.find(params[:id])
  end
end
