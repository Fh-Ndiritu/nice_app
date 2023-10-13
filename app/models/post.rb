class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true, length: {in: 3..10}


    def summary
        "#{content[0...20]}..."
    end
end
