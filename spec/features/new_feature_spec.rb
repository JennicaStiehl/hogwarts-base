# You are the new web developer for Hogwarts. The IT staff has provided an API where you can get a listing of students.
#
# `http://hogwarts-it.herokuapp.com`
#
# You are to create an app and complete this following user story:

require 'rails_helper'
RSpec.describe "As a user" do
  describe "when select a house" do
    it "can get the students" do
# `      When I visit "/"
        visit '/'
        # And I select "Slytherin" from the dropdown
        select "Slytherin"
        # And I click on "Get Students"
        click_on "Get Students"
        # Then my path should be "/search" with "house=slytherin" in the parameters
        expect(current_path).to eq('/search')
        # And I should see a message "22 Students"
        within('.results') do
          expect(page).to have_content("22 Students")
        end
        # And I should see a list of the 22 members of Slytherin
        within('.members', count: 22) do
        # And I should see a name and id for each student.
          expect(page).to have_css('.student-name')
          expect(page).to have_css('.student-id')
        end
      end
    end
  end

# http://hogwarts-it.herokuapp.com/api/v1/house/gryffindor?api_key=alohamora
# Your key is: alohamora
