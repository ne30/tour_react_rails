class Companion < ApplicationRecord
    enum gender: [ :m, :f ]
    validates :gender, presence: true
end
