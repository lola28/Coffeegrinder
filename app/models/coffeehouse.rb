class Coffeehouse < ApplicationRecord

  has_many :checkins, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :openingtime, presence: true
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch

  pg_search_scope :search_by_location,
    against: [ :location ],
    using: {
      tsearch: { prefix: true }
  }
end
