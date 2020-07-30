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

  def advanced_search_name_and_year(name, year)
    resp = conn.get('/advanced') do |req|
      req.params['name'] = "#{name}"
      req.params['date'] = year.to_i
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  def advanced_search_year(year)
    resp = conn.get('/advanced/year') do |req|
      req.params['date'] = year.to_i
    end
    JSON.parse(resp.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://obituary-microservice.herokuapp.com')
  end
end
