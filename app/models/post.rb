class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true, length: {in: 3..100}
    belongs_to :user

    scope :active, ->{where(active: true)}

    def summary
        "#{content[0...20]}..."
    end

    
end
