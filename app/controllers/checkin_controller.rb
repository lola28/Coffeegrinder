class CheckInController < ApplicationController
  def create
    @coffeehouse = Coffeehouse.find(params[:coffeehouse_id])
    @checkin = CheckIn.new
    @checkin.coffeehouse = @coffeehouse
    @checkin.user = current_user
    authorize @checkin
    @checkin.save
  end

  def update
  end

  def destroy
    @coffeehouse = Coffeehouse.find(params[:coffeehouse_id])
    @checkin = CheckIn.where({coffeehouse: @coffeehouse, user: current_user}).first
    authorize @checkin
    @checkin.destroy
  end
end
