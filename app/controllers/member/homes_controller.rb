class Member::HomesController < ApplicationController
  def top
    @total_quests = Quest.all
    @quests = Quest.all.page(params[:page]).per(8)
  end
end
