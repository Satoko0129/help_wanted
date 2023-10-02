class Member::HomesController < ApplicationController
  def top
    @total_quests = Quest.where(member_id: nil)
    @quests = @total_quests.page(params[:page]).per(8)
  end

  def mypage
    @quests = Quest.where(member_id: current_member.id).where.not(status: 2)
  end


  def about
  end


end
