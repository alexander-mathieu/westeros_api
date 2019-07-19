class WesterosService
  def initialize(house)
    @house = house
  end

  def house_member_search
    parse_api_call("house/#{house}")[:data][0][:attributes][:members]
  end

  private
  attr_reader :house

  def parse_api_call(url, params = {})
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://westerosapi.herokuapp.com/api/v1') do |f|
      f.params['api_key'] = ENV['SUPER_SECRET_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
