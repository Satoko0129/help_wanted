class Admin::HomesController < ApplicationController
  layout 'admin_application'
  def top
    @quests = Quest.all.page(params[:page]).per(10)
  end
end
