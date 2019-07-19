require 'rails_helper'

RSpec.describe HouseMember, type: :model do
  before :each do
    attributes = { id: 1,
                   name: 'Super Cool Guy' }

    @house_member = HouseMember.new(attributes)
  end

  it 'exists' do
    expect(@house_member).to be_a(HouseMember)
  end

  describe 'instance methods' do
    it '#id' do
      expect(@house_member.id).to eq(1)
    end

    it '#name' do
      expect(@house_member.name).to eq('Super Cool Guy')
    end
  end
end
