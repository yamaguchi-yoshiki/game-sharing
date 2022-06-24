class Admin::TagsController < Admin::ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:alert] = 'タグを削除しました'
    redirect_to admin_tags_path
  end
end
