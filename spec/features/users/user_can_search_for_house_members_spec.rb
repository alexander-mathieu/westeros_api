require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit /' do
    it 'I see a dropdown menu and button' do
      visit root_path

      expect(page).to have_field(:house)
      expect(page).to have_button('Search Members')
    end

    describe "and select 'Greyjoy' from the dropdown menu and click 'Search Members'" do
      before :each do
        visit root_path

        select 'Greyjoy', from: :house
        click_button 'Search Members'
      end

      it 'my path should be /search' do
        expect(current_path).to eq(search_path)
      end

      it "I see 'house=greyjoy' in the parameters" do
        expect(current_url).to include('house=greyjoy')
      end

      it "I see a message that says '7 Members'" do
        expect(page).to have_content('7 Members')
      end

      it 'I see a list of the 7 members of House Greyjoy, each with a name and ID' do

      end
    end
  end
end



# Then my path should be "/search" with "house=greyjoy" in the parameters
# And I should see a message "7 Members"
# And I should see a list of the 7 members of House Greyjoy
# And I should see a name and id for each member.
