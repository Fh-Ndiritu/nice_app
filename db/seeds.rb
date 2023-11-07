# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'factory_bot'
# require_relative '../spec/factories/users'

include FactoryBot::Syntax::Methods

Rails.application.eager_load!
ApplicationRecord.descendants.map(&:name).each{|model| model.constantize.destroy_all}


2.times do 
    store = create(:store)
    [1,2].sample.times do 
        user = create(:user, store: store)
        [1,2,3].sample.times do 
            create(:electronic, store: store)
        end
    end

end

