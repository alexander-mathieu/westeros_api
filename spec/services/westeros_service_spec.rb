require 'rails_helper'

RSpec.describe WesterosService do
  before :each do
    @westeros_service = WesterosService.new('greyjoy')
  end

  it 'exists' do
    expect(@westeros_service).to be_a(WesterosService)
  end

  describe '#house_member_search' do
    it 'returns a list of house members using house a house ID' do
      house_member_search = @westeros_service.house_member_search

      expect(house_member_search).to be_an(Array)
      expect(house_member_search.count).to eq(7)
      expect(house_member_search.first).to be_a(Hash)
      expect(house_member_search.first).to have_key(:id)
      expect(house_member_search.first).to have_key(:name)
    end
  end
end
