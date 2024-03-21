class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations
    has_one_attached :image
    validates :facility_name, :introduction, :prices, :address
    validates :prices, length: {minimum: 1}
    
end
