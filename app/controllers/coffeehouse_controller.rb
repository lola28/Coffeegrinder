class CoffeehouseController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  layout "showpage", only: [:show]

  def index
    @coffeehouses = policy_scope(Coffeehouse).where.not(latitude: nil, longitude: nil)

    # @user_interests = []
    # @activities.each do |activity|
    #   interests = policy_scope(Interest).where({ activity: activity, user: current_user })
    #   @user_interests << interests.first if !interests.first.nil?

    # @markers = @activities.map do |activity|
    #   {
    #     lat: activity.latitude,
    #     lng: activity.longitude,
    #     infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity }),
    #     image_url: helpers.asset_url('running-circle.png')
    #   }
    # end

    # if params[:activity_query].present?
    #   @activities = @activities.search_by_name(params[:activity_query])
    #   @markers = @activities.map do |activity|
    #   {
    #     lat: activity.latitude,
    #     lng: activity.longitude,
    #     infoWindow: render_to_string(partial: "infowindow", locals: { activity: activity }),
    #     image_url: helpers.asset_url('running-circle.png')
    #   }
    #   end
    # end

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
