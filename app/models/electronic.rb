class Electronic < ApplicationRecord
    validates :name, presence: true, length: {in: 4...70}

    default_scope { order(id: :desc)}


    after_create_commit ->{ broadcast_prepend_to "electronics", partial: "electronics/electronic", locals: { electronic: self}, target: "electronics" }
end
