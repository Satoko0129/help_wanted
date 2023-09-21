class Member::QuestsController < ApplicationController
  def index
    @total_quests = Quest.all
    @quests = Quest.all.page(params[:page]).per(8)
  end
end
