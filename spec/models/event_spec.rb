require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { Event.new }
  let(:event_1) { Event.create(title: 'Event test', date: Date.today + 1) }
  let(:creator) { User.create(username: 'Creator test') }
  let(:user_1) { User.create(username: 'User test 1') }
  let(:user_2) { User.create(username: 'User test 2') }
  
  context 'Event relation with Users:' do
    it "is created by a user" do
      e = Event.reflect_on_association(:creator)
      expect(e.macro).to eq(:belongs_to)
    end

    it "can have many attendees." do
      e = Event.reflect_on_association(:attendees)
      expect(e.macro).to eq(:has_many)
    end
  end

  context 'Event relation with invitations:' do
    it "can have many invitations" do
      e = Event.reflect_on_association(:invitations)
      expect(e.macro).to eq(:has_many)
    end
  end

  context 'When an event is created' do
    it 'Is not valid if doesn\'t have a title ' do
      event.date = Date.today
      event.title = nil
      event.creator_id = creator.id
      expect(event).to_not be_valid
    end

    it 'Is not valid if doesn\'t have a date ' do
      event.date = nil
      event.title = 'Title'
      event.creator_id = creator.id
      expect(event).to_not be_valid
    end

    it 'Is not valid if doesn\'t have a creator ' do
      event.date = Date.today
      event.title = 'Title'
      event.creator_id = nil
      expect(event).to_not be_valid
    end

    it 'Is only valid if at least have a date, a title and a creator' do
      event.date = Date.today
      event.title = 'Title'
      event.creator_id = creator.id
      expect(event).to be_valid
    end
  end

  context 'Event attendees' do
    before do
      creator.events.push event_1
      event_1.attendees.push user_1
    end

    it 'shows the list of attendees for the event' do
      expect(event_1.attendees_members.count).to be 1
    end

    it 'adds a new attendee to the list' do
      expect{event_1.add_new_attendee(user_2)}.to change{event_1.attendees.count}.from(1).to(2)
    end    
    
    it 'adds an error to Event when trying to add a user twice to the same event' do
      event_1.add_new_attendee(user_2)
      expect{event_1.add_new_attendee(user_2)}.to change{event_1.errors.full_messages.count}.from(0).to(1)
    end
  end

  context 'Invitations to private events' do
    before do
      event_1.update(accessibility: true)
      creator.events.push(event_1)
    end

    it 'creates a new invitation' do
      expect(Event.add_new_invitation(event_1, user_1.id)).to be true
    end

    it 'says if a user is in the invitees list' do
      Event.add_new_invitation(event_1, user_1.id)
      expect(event_1.user_in_invited_list?(user_1.id)).to be true
    end

    it 'changes the invitation status to \'declined\'' do
      Event.add_new_invitation(event_1, user_1.id)
      expect(event_1.set_status_to_declined(user_1.id)).to be true
    end

    it 'changes the invitation status to \'accepted\'' do
      Event.add_new_invitation(event_1, user_1.id)
      expect(event_1.send(:if_invitation_update, user_1)).to be true
    end
  end

end

