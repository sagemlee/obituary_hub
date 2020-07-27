class ObituaryService

  def get_obituaries
    JSON.parse(conn.get.body, symbolize_names: true)
  end

  def get_covid_obituaries
    resp = conn.get('/covid')
    JSON.parse(resp.body, symbolize_names: true)
  end



  private

  def conn
    Faraday.new('https://obituary-microservice.herokuapp.com')
  end
end
