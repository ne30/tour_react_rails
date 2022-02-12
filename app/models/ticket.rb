class Ticket < ApplicationRecord
    belongs_to :user
    belongs_to :tour


    def cancelTicket
        
    end
end
