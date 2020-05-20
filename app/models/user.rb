class User < ApplicationRecord
  has_many :events,  foreign_key: 'creator_id', class_name: 'Event'
  has_many :attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendances, class_name: 'Event'

  has_many :invitation_hosts, foreign_key: :invitee_id, class_name: 'Invitation', dependent: :destroy
  has_many :hosts, through: :invitation_hosts, source: :host
  
  has_many :invitations_invitees, foreign_key: :host_id, class_name: 'Invitation', dependent: :destroy
  has_many :invitees, through: :invitations_invitees, source: :invitee

  validates :username, length: { minimum: 3 }

  scope :uninvited_users, -> (event) do
    where.not(id: Invitation.select(:invitee_id).where(event_id: event.id))
    .where('id != ?', event.creator.id)
  end

  def upcoming_events
    attended_events.where('date >= now()'  ).order('date asc')
  end 

  def past_events
    attended_events.where('date < now()' ).order('date desc')
  end 

  def upcoming_created_events
    events.where('date >= now()' ).order('date asc')
  end

  def past_created_events
    events.where('date < now()' ).order('date desc')
  end

  def pending_invitations
    invitation_hosts.where(status: 'pending')
    .where('invitations.created_at >= DATE(now())').order('invitations.created_at asc')
  end

  def pending_invitations_count
    invitation_hosts.where(status: 'pending')
    .where('invitations.created_at >= DATE(now())').count
  end

end
