class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, source: :attendee
  belongs_to :creator, class_name: 'User'

  scope :past, -> { where(' DATE(date) < ? ', Date.today ).order(date: :desc) }
  scope :upcoming, -> { where(' DATE(date) >= ? ', Date.today ).order(date: :desc) }
  scope :attendees_members, -> (event_id){ select('users.*')
                                          .where('attendances.attended_event_id = ?', event_id)
                                          .joins(:attendees)
                                          .order(register_date: :asc) }
  
  def self.add_new_attendee(event_id, user)
    event = Event.find(event_id)
    attendance = event.attendees.push(user)
    event
  rescue ActiveRecord::RecordNotUnique => e
    event.errors.add(:register_already, message: 'You are already attending this event' )
    event
  end                                          
end
