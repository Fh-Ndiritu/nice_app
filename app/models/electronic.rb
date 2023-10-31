class Electronic < ApplicationRecord
    validates :name, presence: true, length: {in: 4...70}
end
