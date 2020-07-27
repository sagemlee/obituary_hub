class ObituarySearch

  def search_covid_obituaries
    json = ObituaryService.new.get_covid_obituaries
    json.map do |obituary_data|
      ApiObituary.new(obituary_data)
    end
  end

  def search_obituaries_by_name(name)
    json = ObituaryService.new.get_obituaries_by_name(name)
    json.map do |obituary_data|
      ApiObituary.new(obituary_data)
    end
  end

end
