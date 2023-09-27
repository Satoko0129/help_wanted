class Admin::MembersController < ApplicationController
  layout 'admin_application'
  
  def index
    @members = Member.all

  end
  
  def show
    @member = Member.find(params[:id])
    @quests = Quest.where(member_id: @member.id).where.not(status: 2)
  end
end
