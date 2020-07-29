class ObituaryService

  def get_obituaries
    JSON.parse(conn.get.body, symbolize_names: true)
  end

  def get_covid_obituaries
    resp = conn.get('/covid')
    JSON.parse(resp.body, symbolize_names: true)
  end

  def get_obituaries_by_name(name)
    resp = conn.get('/name') do |req|
      req.params['name'] = "#{name}"
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  def get_recent_obituaries
    resp = conn.get('/recent')
    JSON.parse(resp.body, symbolize_names: true)
  end

  def get_advanced_obituaries(name, year)

    resp = conn.get('/advanced') do |req|
      req.params['name'] = "#{name}"
      req.params['date'] = year.to_i
    end
    JSON.parse(resp.body, symbolize_names: true)
  end



  private

  def conn
    Faraday.new('https://obituary-microservice.herokuapp.com')
  end
end
