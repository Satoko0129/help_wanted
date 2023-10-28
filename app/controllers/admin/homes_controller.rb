class Admin::HomesController < ApplicationController
  layout 'admin_application'
  def top
    if admin_signed_in?
    @total_quests = current_admin.quests.where.not(status: 2)
    @quests = @total_quests.page(params[:page]).per(10)
    else
    # ログインしていない場合の処理を追加（例：エラーメッセージやリダイレクト処理など）
    flash[:notice] = 'ログインが必要です'
    redirect_to new_admin_session_path
    end
  end
end
