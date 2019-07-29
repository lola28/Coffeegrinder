class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]
  layout "homepage", only: [:home]
  def home
  end

  def dashboard
    @user_cofeehouses = policy_scope(Coffeehouse).where(user: current_user)

    # user_interests = policy_scope(Interest).where(user: current_user)
    # @interests = []
    # user_interests.each do |interest|
    #   @interests << interest.activity
    # end

    user_checkins = policy_scope(Booking).where(user: current_user)
    @future_checkins = []
    @past_checkins = []
    user_checkins.each do |checkin|
      if checkin.coffeehouse.openingtime > Time.now
        @future_checkins << checkin
      else
        @past_checkins << checkin
      end
    end
  end

end
