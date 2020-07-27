class CovidObituarySearch

  def search_covid_obituaries
    json = ObituaryService.new.get_covid_obituaries
    json.map do |obituary_data|
      ApiObituary.new(obituary_data)
    end
  end

end
