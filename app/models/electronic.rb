class Electronic < ApplicationRecord
    validates :name, presence: true, length: {in: 4...70}

    default_scope { order(id: :desc)}


    # after_create_commit ->{ broadcast_prepend_to "electronics", partial: "electronics/electronic", locals: { electronic: self}, target: "electronics" }
    after_create_commit ->{ broadcast_prepend_to "electronics"}
    after_update_commit ->{broadcast_update_to "electronics"}
    after_destroy_commit ->{broadcast_remove_to "electronics"}

end
