class Store < ApplicationRecord
    validates :name, presence: true
    has_many :users
    has_many :electronics
end
