class Member::QuestsController < ApplicationController
  def show
  end

  def update
  end

  def receive
  end


  private
  def Quests_params
    params.require(:quest).permit(:member_id, :name, :introduction, :price, :level, :time, :is_draft, :status, :image_id)
  end
end
