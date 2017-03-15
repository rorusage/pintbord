class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @pictures = Picture.all.order("like_amount DESC")
  end

  def new
    @picture = current_user.pictures.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)

    if @picture.save
      redirect_to pictures_path, notice: "新增圖片成功！"
    else
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "更新圖片成功！"
    else
      render :edit
    end
  end

  def like
    @picture = Picture.find(params[:id])
    @picture.like!

    redirect_to pictures_path
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, alert: "刪除圖片成功！"
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :description, :image, :remove_image)
  end
end
