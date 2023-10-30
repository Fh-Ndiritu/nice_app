class Car < ApplicationRecord
    belongs_to :user
    validates :price, presence: true
    validates :brand, presence: true 
    validates :car_model, presence: true
end
