class Admin::MembersController < ApplicationController
  layout 'admin_application'

  def index
    @members = Member.all

  end

  def show
    @member = Member.find(params[:id])
    @quests = Quest.where(member_id: @member.id).where.not(status: 2)
    @wallet = Wallet.where(member_id: @member.id).sum(:remaining_money).to_i
  end

  def permission #許可 Ｇはそのまま消費される
    member = Member.find(params[:member_id])
    exchange_request = member.exchange_requests.where(appoval_flag: :applying).order(created_at: :desc).first
    if exchange_request
      exchange_request.appoval_flag = :permission
      if exchange_request.save
      else
      end
    end
    redirect_to admin_members_path
  end

  def rejected #拒否 Ｇは消費されずwalletに戻る
    member = Member.find(params[:member_id])
    exchange_request = member.exchange_requests.where(appoval_flag: :applying).order(created_at: :desc).first
    if exchange_request
      if exchange_request.destroy
      else
      end
    end
    redirect_to admin_members_path
  end
end
