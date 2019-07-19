class SearchIndexFacade
  def initialize(house)
    @house = house
  end

  def house_member_count
    house_members.count
  end

  def house_members
    @house_members ||= house_member_results.map do |attributes|
      HouseMember.new(attributes)
    end
  end

  private

  def house_member_results
    @house_member_results ||= westeros_service.house_member_search
  end

  def westeros_service
    @westeros_service ||= WesterosService.new(@house)
  end
end
