class WesterosService
  def initialize(house)
    @house = house
    @house_id = house_id
  end

  def house_member_search
    parse_api_call("house/#{@house_id}")
  end

  private

  def house_id
    houses = parse_api_call('house')
    house = houses.detect do |result|
      result[:name].downcase == @house
    end
    house[:id]
  end

  def parse_api_call(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://westeros-as-a-service.herokuapp.com/api/v1') do |f|
      f.headers['x_api_key'] = ENV['NEW_SUPER_SECRET_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
