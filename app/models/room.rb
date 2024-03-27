class Room < ApplicationRecord
    before_create :default_room_image
    belongs_to :user
    has_many :reservations
    has_one_attached :image
    validates :facility_name, :introduction, :prices, :address, presence:true
    validates :prices, length: {minimum: 1}
    def default_room_image
        if !self.image.attached?
            file_path = Rails.root.join('app/assets/images/default_room.png')
            self.image.attach(io: File.open(file_path), filename: 'default_room.png', content_type: 'image/png')
        end
    end
end
