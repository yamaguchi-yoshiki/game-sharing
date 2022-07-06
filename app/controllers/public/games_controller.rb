class Public::GamesController < ApplicationController
  before_action :authenticate_admin_customer, only: [:new, :create, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]
  before_action :ensure_guest_customer, only: [:new, :create, :edit, :update]

  def index
    @games = Game.latest.page(params[:page])
    @platforms = Platform.all
    @tags = Tag.all
  end

  def show
    @game = Game.find(params[:id])
    @tags = @game.tags.pluck(:name).join(',')
    if customer_signed_in?
      @reviews = @game.reviews.where.not(customer_id: current_customer.id).where(is_public: true)
      @review = @game.reviews.find_by(customer_id: current_customer.id)
    elsif admin_signed_in?
      @reviews = @game.reviews
    else
      @reviews = @game.reviews.where(is_public: true)
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    # タグの保存、紐付け
    @tags = params[:game][:name].delete(' ').delete('　').split(',').uniq
    @tags.each do |tag|
      old_tag = Tag.find_by(name: tag)
      if old_tag == nil
        new_tag = Tag.new(name: tag)
        if new_tag.valid?
          new_tag.save
          @game.tags << new_tag
        else
          render "new"
        end
      else
        @game.tags << old_tag
      end
    end
    # 投稿の保存
    if @game.save
      thread_board = @game.thread_boards.new
      thread_board.title = "雑談(自動生成)"
      thread_board.introduction = "ゲームを追加すると自動で作られるスレッドです。
      雑談など自由にお使いください。(過度なネタバレはしないようにお願いします。)"
      thread_board.no_spoiler = true
      thread_board.save
      redirect_to game_path(@game), notice: "ゲームを追加しました"
    else
      render "new"
    end
  end

  def edit
    @game = Game.find(params[:id])
    @tags = @game.tags.pluck(:name).join(',')
  end

  def update
    @game = Game.find(params[:id])
    # タグの保存、紐付け
    @game.game_tags.destroy_all
    @tags = params[:game][:name].delete(' ').delete('　').split(',').uniq
    @tags.each do |tag|
      old_tag = Tag.find_by(name: tag)
      if old_tag == nil
        new_tag = Tag.new(name: tag)
        if new_tag.valid?
          new_tag.save
          @game.tags << new_tag
        else
          render "new"
        end
      else
        @game.tags << old_tag
      end
    end
    # 投稿の更新
    if @game.update(game_params)
      redirect_to game_path(@game), notice: "ゲーム情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:alert] = '選択したゲームを削除しました'
    redirect_to games_path
  end

  def search
    @platforms = Platform.all
    @tags = Tag.all
    if params[:word]
      @word = params[:word]
      @total_games = Game.where("title LIKE?","%#{@word}%")
      @games = @total_games.latest.page(params[:page])
    elsif params[:type] == "platform"
      @word = params[:commit]
      @platform = Platform.find_by(name: @word)
      @total_games = Game.where(platform_id: @platform.id)
      @games = @total_games.latest.page(params[:page])
    elsif params[:type] == "tag"
      @word = params[:commit]
      @tag = Tag.find_by(name: @word)
      @total_games = @tag.games
      @games = @total_games.latest.page(params[:page])
    end
    render "index"
  end

  private

  def game_params
    params.require(:game).permit(
      :platform_id,
      :title,
      :introduction,
      :release_date,
      :no_tax_price,
      :related_url,
      :game_image
    )
  end

  def ensure_guest_customer
    if customer_signed_in?
      @customer = current_customer
      if @customer.email == "guest@example.com"
        redirect_to customer_path(@customer) , notice: 'ゲストユーザーはゲームを追加、編集できません。'
      end
    end
  end
end
