class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = current_user.pictures.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)

    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end
  private

  def picture_params
    params.require(:picture).permit(:title, :description, :image)
  end
end
