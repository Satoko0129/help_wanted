class Admin::HomesController < ApplicationController
  layout 'admin_application'
  def top
    @total_quests = Quest.where.not(status: 2)
    @quests = @total_quests.page(params[:page]).per(10)
  end
end
