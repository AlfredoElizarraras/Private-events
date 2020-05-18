class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, source: :attendee
  has_many :invitations
  validates :title, :date, presence: true

  scope :upcoming_events, -> (user = nil) do 
    if user.nil?
      where(accessibility: false)
      .where(' date >= now()').order('date asc')
    else
      where(' date >= now()').order('date asc')
      .left_joins(:invitations).distinct(:id)
      .where('events.accessibility = ? or events.creator_id = ? or invitations.invitee_id = ?', false, user.id, user.id)
    end
  end

  scope :previous_events, -> (user = nil) do
    if user.nil?
      where(accessibility: false)
      .where(' date < now()').order('date desc')
    else
      where(' date < now()').order('date desc')
      .left_joins(:invitations).distinct(:id)
      .where('events.accessibility = ? or events.creator_id = ? or invitations.invitee_id = ?', false, user.id, user.id)
    end
  end

  def attendees_members
    attendees.order('attendances.created_at desc')
  end

  def add_new_attendee(user)
    attendance = attendees.push(user)
    if_invitation_update(user)
  rescue ActiveRecord::RecordNotUnique => e
    errors.add(:register_already, message: 'You are already attending this event!')
  end

  def self.add_new_invitation(event,invitee_id)
    invitation = Invitation.new
    invitation.host_id = event.creator_id
    invitation.event_id = event.id
    invitation.invitee_id = invitee_id
    invitation.status = 'pending'
    invitation.save
  end

  def user_in_invited_list?(user_id)
    invited = invitations.where(invitee_id: user_id).first
    invited.nil? ? false : true
  end


  def set_status_to_declined(invitee_id)
    invitation = Invitation.where(event_id: id, invitee_id: invitee_id).first
    unless invitation.nil?
      invitation.update(status: 'declined')
    end 
  end

  private

  def if_invitation_update(user)
    invitation = Invitation.where(event_id: id, invitee_id: user.id).first
    unless invitation.nil?
      invitation.update(status: 'accepted')
    end 
  end

end
