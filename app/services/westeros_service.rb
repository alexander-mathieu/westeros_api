class WesterosService
  def initialize(house)
    @house = house
  end

  def house_member_search
    parse_api_call("house/#{house_id}")
  end
  
  private
  attr_reader :house

  def house_id
    results = parse_api_call('house')
    house = results.detect do |result|
      result[:name].downcase == @house
    end
    house[:id]
  end

  def parse_api_call(url, params = {})
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://westeros-as-a-service.herokuapp.com/api/v1/') do |f|
      f.headers['x_api_key'] = ENV['NEW_SUPER_SECRET_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
