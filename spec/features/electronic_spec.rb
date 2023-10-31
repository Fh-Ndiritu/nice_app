require 'rails_helper'

RSpec.describe 'creating', type: :feature do 
    describe 'adding a new electronic' do 
        visit electronics_path
        it 'has electronics title' do 
            expect(page).to have_content("Shop for Electronics")
            click_on("New Electronic")

            expect(page).to have_content("Create Electronic")

            fill_in "Name", with: "Macbook M1"
            fill_in "Price", with: "1500"

            click_on("Create Electronic")

            expect(page).to have_content("Shop for Electronis")
            expect(page).to have_content("Macbook M1")

        end
    end

    describe 'showing device cruds ' do 
        subject = create(:electronic, name: "Macbook M2")

        it 'can create a new electronic' do 
            visit "/electronis/#{subject.id}"
            expect(page).to have_content(subject.name)
        end

        it 'can update electronic' do 
            visit electronics_path
            first(:link, "Edit").click
            expect(page).to have_content("Edit Electronic")
            fill_in "Name", with: "Edited Mac"
            click_on("Update")
            expect(page).to have_content("Edited Mac")
        end

        it 'can be destroyed' do 
            visit electronics_path
            first(:link, "Destroy").click
            expect(page).to_not have_content(subject.name)
        end

        
    end



end