class CoffeehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  layout "showpage", only: [:show]

  def index
    @coffeehouses = policy_scope(Coffeehouse).where.not(latitude: nil, longitude: nil)
    @coffeehouses = Coffeehouse.geocoded
    #@coffeehouses = Coffeehouse.all
    # @user_interests = []
    # @activities.each do |activity|
    #   interests = policy_scope(Interest).where({ activity: activity, user: current_user })
    #   @user_interests << interests.first if !interests.first.nil?

     @markers = @coffeehouses.map do |coffeehouse|
      {
         lat: coffeehouse.latitude,
         lng: coffeehouse.longitude,
         infoWindow: render_to_string(partial: "infowindow", locals: { coffeehouse: coffeehouse }),
         image_url: helpers.asset_url('coffee_icon.png')
       }
     end

     if params[:location_query].present?
       @acoffeehouses = @coffeehouses.search_by_location(params[:location_query])
       @markers = @coffeehouses.map do |coffeehouse|
       {
         lat: coffeehouse.latitude,
         lng: coffeehouse.longitude,
         infoWindow: render_to_string(partial: "infowindow", locals: { coffeehouse: coffeehouse }),
         image_url: helpers.asset_url('coffee_icon.png')
       }
       end
     end

    # if params[:location_query].present?
    #   @activities = @activities.search_by_location(params[:location_query])
    #   @markers = @activities.map do |activity|
    #   {
    #     lat: activity.latitude,
    #     lng: activity.longitude,
    #     infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity }),
    #     image_url: helpers.asset_url('running-circle.png')
    #   }
    #   end
  end

  def show
    @coffeehouse = Coffeehouse.find(params[:id])
    authorize @coffeehouse
  end

  def edit
    @coffeehouse = Coffeehouse.find(params[:id])
    authorize @coffeehouse
  end

  def update
    @coffeehouse = Coffeehouse.find(params[:id])
    authorize @coffeehouse
  end

  def new
    @coffeehouse = Coffeehouse.new
    authorize @coffeehouse
  end

  def create
    @coffeehouse = Coffeehouse.new(coffeehouse_params)
    authorize @coffeehouse
  end

  def destroy
    @coffeehouse = Coffeehouse.find(params[:id])
    authorize @coffeehouse
    @coffeehouse.destroy
  end

  private

  def coffeehouse_params
    params.require(:coffeehouse).permit(:name, :openingtime, :location, :category_id, :description)
  end
end
