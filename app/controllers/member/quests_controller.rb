class Member::QuestsController < ApplicationController
  def show
    @quest = Quest.find(params[:id])
  end

  def update
  end

  def receive
  end

  def complete
  end


  private
  def Quests_params
    params.require(:quest).permit(:member_id, :name, :introduction, :price, :level, :time, :is_draft, :status, :quest_image)
  end
end
