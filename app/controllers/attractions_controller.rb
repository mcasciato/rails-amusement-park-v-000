class AttractionsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    @user = User.find(session[:user_id])
    @attraction = Attraction.find_by(id: params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :min_height, :tickets)
  end
end
