class Coffeehouse < ApplicationRecord
  belongs_to :category
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many :checkins, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :openingtime, presence: true
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
