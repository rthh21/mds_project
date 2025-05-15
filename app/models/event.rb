class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :registrations
  has_many :users, through: :registrations
end
