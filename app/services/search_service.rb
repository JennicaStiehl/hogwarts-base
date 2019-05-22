class SearchService
  def initialize(house)
    @house = house
  end

  def find_house
    results = get_json("house")
    id_hash = results.find do |house_data|
      house_data[:name] == @house
    end
    id_hash[:id]
  end

  def get_members
    id = find_house
    get_json("house/#{id}")
  end

  private
    def conn
      Faraday.new("https://hogwarts-as-a-service.herokuapp.com/api/v1/") do |f|
        f.headers["x_api_key"] = "lumos"
        f.adapter Faraday.default_adapter
      end
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
