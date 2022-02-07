class TicketsController < ApplicationController
    before_action :checkUser

    def checkUser
        if session[:user_id].present?
            if User.exists?session[:user_id]
                @user = User.find(session[:user_id])
            else
                redirect_to sign_up_path, notice: "Login Please"
            end
        else
            redirect_to sign_up_path, notice: "Logged Out"
        end
    end

    def showUserTickets 
        @tickets = @user.tickets
    end

    def showAllTickets
        @all_tickets = Ticket.all
    end
end