class SearchIndexFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def house_member_count
    house_member_results.count
  end

  def house_members
    @house_members ||= house_member_results.map do |attributes|
      HouseMember.new(attributes)
    end
  end

  private

  def house_member_results
    @results ||= westeros_service.house_member_search
  end

  def westeros_service
    @westeros_service ||= WesterosService.new(house)
  end
end
