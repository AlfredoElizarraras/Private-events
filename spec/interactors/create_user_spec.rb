require 'spec_helper'

RSpec.describe CreateUser, type: :interactor do
  subject(:instance) { CreateUser.new }
  let (:result) { nil }
  describe '.call' do
    context "when given a valid username" do
      
      #let(:user) { User.create() }

      before do
        #allow(User).to receive(:create).with("johnsmith").and_return(user)
        result =  CreateUser.call(user_params: {username: 'johnsmith'})
      end

      it "adds a user " do 
        expect { CreateUser.call(user_params: "johnsmith") }.to change{ User.count }.by(1)
      end
      it "succeeds" do
        expect(result.context).to be_a_success
      end

      it "provides the user" do
        p '*******************'
        expect(result.context.user.username).to eq('johnsmith')
      end

    end
  end
end
