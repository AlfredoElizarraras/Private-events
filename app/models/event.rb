class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, source: :attendee
  has_many :invitations
  validates :title, :date, presence: true

  scope :upcoming_events, -> { where(' date >= now()').order('date asc') }
  scope :previous_events, -> { where(' date < now()').order('date desc') }

  def attendees_members
    attendees.order('attendances.created_at desc')
  end

  def add_new_attendee(user)
    attendance = attendees.push(user)
  rescue ActiveRecord::RecordNotUnique => e
    errors.add(:register_already, message: 'You are already attending this event!')
  end
end
