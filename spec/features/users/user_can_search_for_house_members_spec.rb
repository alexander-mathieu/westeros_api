require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit the root path' do
    it 'I see a dropdown menu and button' do
      visit root_path

      expect(page).to have_field('Select House')
      expect(page).to have_button('Get Members')
    end
  end
end



# And I select "Greyjoy" from the dropdown
# And I click on "Get Members"
# Then my path should be "/search" with "house=greyjoy" in the parameters
# And I should see a message "7 Members"
# And I should see a list of the 7 members of House Greyjoy
# And I should see a name and id for each member.
