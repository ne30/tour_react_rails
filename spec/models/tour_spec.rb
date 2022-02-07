require 'rails_helper'

RSpec.describe Tour, type: :model do
  it "should have many tickets" do
    t = Tour.reflect_on_association(:tickets)
    expect(t.macro).to eq(:has_many)
  end
end
