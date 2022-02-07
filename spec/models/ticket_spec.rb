require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it "Associations" do
    should belong_to(:user).without_validating_presence
  end
end
