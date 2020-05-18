class Invitation < ApplicationRecord
    belongs_to :host, class_name: 'User'
    belongs_to :invitee, class_name: 'User'
    belongs_to :event

end
