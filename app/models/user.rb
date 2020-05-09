class User < ApplicationRecord
  has_many :events,  foreign_key: :creator_id, class_name: 'Event', dependent: :destroy
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, class_name: 'Event'
end
