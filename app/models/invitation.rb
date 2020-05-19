class Invitation < ApplicationRecord
    belongs_to :host, class_name: 'User'
    belongs_to :invitee, class_name: 'User'
    belongs_to :event

    scope :pending_invitations, -> (user_id) do
        joins(host: { events: :creator } )
        .where(invitee_id: 1)
        .where(status: 'pending')
        .select('users.id as creator_id, users.username as creator')
        .select('events.id as event_id, events.title as title')
        .where('invitations.created_at >= DATE(now())')
        .order('invitations.created_at asc')
    end        
end
