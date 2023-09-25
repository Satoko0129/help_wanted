class Admin::QuestsController < ApplicationController
  layout 'admin_application'
  def index
    @quests = Quest.all
  end

  def show
    @quest = Quest.find(params[:id])
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    # 投稿ボタンを押下した場合
    if params[:post]
      if @quest.save(context: :publicize)
        redirect_to admin_quest_path(@quest), notice: "新規クエストを投稿しました！"
      else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # 下書きボタンを押下した場合
    else
      @quest.is_draft = true
      if @quest.save
        redirect_to admin_quest_path(@quest), notice: "クエストを下書き保存しました！"
      else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  def edit
    @quest = Quest.find(params[:id])
    @quests = Quest.all
  end

  def update
    @quest = Quest.find(params[:id])
    # ①下書きクエストの更新（公開）の場合
    if params[:publicize_draft]
      # クエスト公開時にバリデーションを実施
      # updateメソッドにはcontextが使用できないため、公開処理にはattributesとsaveメソッドを使用する
      @quest.attributes = quest_params.merge(is_draft: false)
      if @quest.save(context: :publicize)
        redirect_to admin_quest_path(@quest.id), notice: "下書きのクエストを公開しました！"
      else
        @quest.is_draft = true
        render :edit, alert: "クエストを公開できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ②公開済みクエストの更新の場合
    elsif params[:update_post]
      @quest.attributes = quest_params
      if @quest.save(context: :publicize)
        redirect_to admin_quest_path(@quest.id), notice: "クエストを更新しました！"
      else
        render :edit, alert: "クエストを更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ③下書きクエストの更新（非公開）の場合
    else
      if @quest.update(quest_params)
        redirect_to admin_quest_path(@quest), notice: "下書きクエストを更新しました！"
      else
        render :edit, alert: "更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end


  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy
    redirect_to '/admin'
  end

  private

  def quest_params
    params.require(:quest).permit(
      :member_id,
      :name,
      :introduction,
      :price,
      :is_draft,
      :price,
      :level,
      :time,
      :quest_image
    )
  end
end
