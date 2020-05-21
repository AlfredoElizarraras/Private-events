class Invitation < ApplicationRecord
    belongs_to :host, class_name: 'User'
    belongs_to :invitee, class_name: 'User'
    belongs_to :event

    scope :pending_invitations, -> (user_id) do
        joins(:event)
        .joins(:host)
        .where(invitee_id: user_id, status: 'pending')
        .where('events.date >= DATE(now())')
        .select('users.id as creator_id, users.username as creator')
        .select('events.id as event_id, events.title as title')
        .order('events.date asc')
    end

    scope :pending_invitations_count, -> (user_id) do
        joins(:event)
        .joins(:host)
        .where(invitee_id: user_id, status: 'pending')
        .where('events.date >= DATE(now())')
        .count
    end
end
