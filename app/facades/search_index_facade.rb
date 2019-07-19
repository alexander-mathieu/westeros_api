class SearchIndexFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def total_results
    results.count
  end

  def house_members
    @house_members ||= results.map do |attributes|
      HouseMember.new(attributes)
    end
  end

  private

  def results
    @results ||= westeros_service.house_member_search
  end

  def westeros_service
    @westeros_service ||= WesterosService.new(house)
  end
end
