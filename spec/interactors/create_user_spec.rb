require 'spec_helper'

RSpec.describe CreateUser, type: :interactor do
  subject(:instance) { CreateUser.call(user_params: {username: 'john'}) }
  subject(:instance_1) { CreateUser.call(user_params: {username: ''}) }
  describe '.call' do
    context "When given a valid new username."do
      it "Succeeds" do
        expect(instance).to be_a_success
      end

      it "Provides the user" do
        expect(instance.user.username).to eq('john')
      end
    end

    context "When the username is blank or nil." do
      it 'Fails' do
        expect(instance_1.user).to be_nil
      end

      it "Provides a failure message" do
        expect(instance_1.message).to be_present
      end
    end
  end
end
