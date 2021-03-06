class ObituaryService

  def get_obituaries
    JSON.parse(conn.get('/api/v1/').body, symbolize_names: true)
  end

  def get_covid_obituaries
    resp = conn.get('/api/v1/covid')
    JSON.parse(resp.body, symbolize_names: true)
  end

  def get_obituaries_by_name(name)
    resp = conn.get('/api/v1/name') do |req|
      req.params['name'] = "#{name}"
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  def get_recent_obituaries
    resp = conn.get('/api/v1/recent')
    JSON.parse(resp.body, symbolize_names: true)
  end

  def advanced_search_name_and_year(name, year)
    resp = conn.get('/api/v1/advanced') do |req|
      req.params['name'] = "#{name}"
      req.params['date'] = year.to_i
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  def advanced_search_year(year)
    resp = conn.get('/api/v1/advanced/year') do |req|
      req.params['date'] = year.to_i
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://obituary-microservice.herokuapp.com')
  end
end
