class Member::QuestsController < ApplicationController
before_action :move_to_signed_in, except: [:show]
before_action :have_gold_sum, only: [:histories, :exchange_request, :exchange_request_receive]

  def show
    @quest = Quest.find(params[:id])
  end

  def receive
    @quest = Quest.find(params[:id])
    @quest.update(status: 1, member_id: current_member.id)
    redirect_to root_path, notice: "がんばってこなそうぜ！"
  end

  def complete
    @quest = Quest.find(params[:id])
    @quest.update(status: 2)
    @wallet = Wallet.find_or_create_by(member_id: current_member.id, quest_id: @quest.id) do |q|
      q.remaining_money = @quest.price
    end
  end

  def giveup
    #受注したクエストのmember idをnilにする
    quest = Quest.find(params[:id])
    quest.update(:member_id => nil)
    redirect_to mypage_path
  end

  def histories; end

  def exchange_request
    @exchange_request = ExchangeRequest.new
  end

  def exchange_request_receive
    @exchange_request = ExchangeRequest.new(exchange_request_params)
    if exchange_request_params[:request_amount].to_i <= @have_gold.to_i && @exchange_request.save
      redirect_to root_path, notice: 'どうなるかな？結果をまちましょう！'
    else
      render :exchange_request
    end
  end

  private
  def move_to_signed_in
    unless member_signed_in?
      #サインインしていないメンバーはログインページが表示される
      redirect_to  new_member_session_path
    end
  end


  def exchange_request_params
    params.require(:exchange_request).permit(:request_amount).merge(member_id: current_member.id)
  end

  def have_gold_sum
    @histories = Wallet.where(member_id: current_member.id).order(created_at: :desc)
    @exchange_requests = ExchangeRequest.where(member_id: current_member.id).order(created_at: :desc)

    @have_gold = @histories.sum(:remaining_money).to_i - @exchange_requests.where.not(appoval_flag: 2).sum(:request_amount)
  end

end
