class Admin::TagsController < Admin::ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def destroy
    @tags = Tag.all
    @tag = Tag.new
    tag = Tag.find(params[:id])
    tag.destroy
    flash[:alert] = 'タグを削除しました'
  end
end
