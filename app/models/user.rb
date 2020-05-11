class User < ApplicationRecord
  has_many :events,  foreign_key: 'creator_id', class_name: 'Event'
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, class_name: 'Event'

  def upcomming_events
    attended_events.where('date >= ?', Date.today )
  end 

  def past_events
    attended_events.where('date < ?', Date.today )
  end 

end
