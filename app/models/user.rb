class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :checkins
  has_many :activities

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

end
