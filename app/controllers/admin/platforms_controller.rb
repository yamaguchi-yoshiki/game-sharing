class Admin::PlatformsController < Admin::ApplicationController
  def index
    @platforms = Platform.all
    @platform = Platform.new
  end

  def create
    @platforms = Platform.all
    @platform = Platform.new(platform_params)
    if @platform.save
      flash[:notice] = "機種を追加しました"
    end
    render "index"
  end

  def edit
    @platform = Platform.find(params[:id])
  end

  def update
    @platform = Platform.find(params[:id])
    if @platform.update(platform_params)
      redirect_to admin_platforms_path, notice: "機種名を更新しました"
    else
      render "edit"
    end
  end

  private

  def platform_params
    params.require(:platform).permit(:name)
  end
end
