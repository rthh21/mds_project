class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :registrations
  has_many :users, through: :registrations
end
# app/models/event.rb
class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :registrations
  has_many :participants, through: :registrations, source: :user

  # Add stream_url column if not exists
  def self.add_stream_url_column
    unless column_names.include?('stream_url')
      connection.add_column :events, :stream_url, :string
    end
  end
end
