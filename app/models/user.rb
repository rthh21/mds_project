class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # DB relationships
  has_many :organized_events, class_name: 'Event', foreign_key: 'organizer_id'
  has_many :registrations
  has_many :events, through: :registrations
end
