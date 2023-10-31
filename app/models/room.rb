class Room < ApplicationRecord
    validates :name, uniqueness: true, length: {in: 2..30}

    scope :public_rooms, ->{where(is_private: false)}
    after_create_commit { broadcast_append_to "rooms"}
end
