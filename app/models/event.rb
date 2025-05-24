class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :registrations
  has_many :users, through: :registrations
  validates :stream_url, presence: true, format: { with: /\.m3u8\z/, message: "must end with .m3u8" }

  def started?
    Time.current >= start_time && Time.current <= end_time
  end
  
  def ended?
    Time.current > end_time
  end

  def upcoming?
    Time.current < start_time
  end

  # Add stream_url column if not exists
  def self.add_stream_url_column
    unless column_names.include?('stream_url')
      connection.add_column :events, :stream_url, :string
    end
  end
end
