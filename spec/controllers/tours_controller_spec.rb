require 'rails_helper'

RSpec.describe ToursController, type: :controller do

    describe "#showAllTour" do
        it "returns all the tour" do 
            allow_any_instance_of(ToursController).to receive(:checkUser).and_return(:true)
            get :showAllTour
            expect(:tours).to_not eq(nil)
            expect(:tickets).to_not eq(nil)
        end

        it "user not logged in doesn't return any tour" do
            get :showAllTour
            expect(response).to have_http_status(302)
        end

        it "passing the correct session id to get all the tours" do
            get(:showAllTour, session: {:user_id => 1})
            expect(:tours).to_not eq(nil)
            expect(:tickets).to_not eq(nil)
        end

        it "passing the wrong session id to get all the tours" do
            get(:showAllTour, session: {:user_id => 100})
            expect(response).to have_http_status(302)
        end
    end

    describe "#showTour" do 
        it "returns a specific tour" do 
            allow_any_instance_of(ToursController).to receive(:checkUser).and_return(:true)
            get(:showTour, params: {:param => "001"})
            expect(response).to have_http_status(200)
        end
    end

    describe "#bookTicketWithoutCompanion" do 
        it "Successful ticket booking without companion" do
            allow_any_instance_of(ToursController).to receive(:checkUser).and_return(:true)
            get(:bookTicketWithoutCompanion, params: {:param => "1"}, session: {:user_id => 1})
            expect(flash[:success]).to be_present
        end

        it "All ticket for the tour has already booked." do
            allow_any_instance_of(ToursController).to receive(:checkUser).and_return(:true)
            get(:bookTicketWithoutCompanion, params: {:param => "2"}, session: {:user_id => 1})
            expect(flash[:error]).to be_present
        end
    end

    describe "#bookTicketWithCompanion" do 
        it "Successful ticket booking with user being the first companion" do
            allow_any_instance_of(ToursController).to receive(:checkUser).and_return(:true)
            get(:bookTicketWithCompanion, params: {:param => "3"}, session: {:user_id => 1})
            expect(flash[:success]).to be_present
        end

        it "Successful ticket booking with user being the second companion" do
            allow_any_instance_of(ToursController).to receive(:checkUser).and_return(:true)
            get(:bookTicketWithCompanion, params: {:param => "1"}, session: {:user_id => 2})
            expect(flash[:success]).to be_present
        end

        it "All ticket for the tour has already booked." do
            allow_any_instance_of(ToursController).to receive(:checkUser).and_return(:true)
            get(:bookTicketWithCompanion, params: {:param => "2"}, session: {:user_id => 1})
            expect(flash[:error]).to be_present
        end
    end
end