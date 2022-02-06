require 'rails_helper'

RSpec.describe User, type: :model do
    subject{ User.new(user_name: "rspec1",\
         gender: 0, password: "rspec",\
         password_confirmation: "rspec",\
         is_admin: false) }
    before { subject.save }
    it 'checking user name' do
        expect(subject.user_name).to eq("rspec1")
    end
end