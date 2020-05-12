class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee

  scope :upcoming_events, -> { where(' date >= now()') }
  scope :previous_events, -> { where(' date < now()') }
  
  def attendees_members
    attendees.order('attendances.created_at desc')
  end
end
