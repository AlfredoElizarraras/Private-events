class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee
  belongs_to :creator, class_name: 'User'

  scope :past, -> { where(" DATE(date) < ? ", Date.today ).order(date: :desc) }
  scope :upcoming, -> { where(" DATE(date) >= ? ", Date.today ).order(date: :desc) }
end
