class User < ApplicationRecord
  has_many :events,  foreign_key: 'creator_id', class_name: 'Event'
  has_many :attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendances, class_name: 'Event'

  def upcoming_events
    attended_events.where('date >= ?', Date.today  ).order('date asc')
  end 

  def past_events
    attended_events.where('date < ?', Date.today ).order('date desc')
  end 

  def upcoming_created_events
    events.where('date >= ?', Date.today ).order('date asc')
  end

  def past_created_events
    events.where('date < ?', Date.today ).order('date desc')
  end 


end
