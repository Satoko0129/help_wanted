class Admin::HomesController < ApplicationController
  def top
    @quests = Quest.all.page(params[:page]).per(10)
  end
end
