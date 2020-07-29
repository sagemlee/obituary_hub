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

  def recent_obituaries
    json = ObituaryService.new.get_recent_obituaries
    json.map do |obituary_data|
      ApiObituary.new(obituary_data)
    end
  end

  def advanced_query(params)
    parse_params(params)
    if params.keys.include?(:name) && params.keys.include?(:year)
      json = ObituaryService.new.advanced_search_name_and_year(params[:name], params[:year])
    elsif params.keys.include?(:name) || params.keys.include?(:year)
      if params[:name]
        json = ObituaryService.new.get_obituaries_by_name(params[:name])
      elsif params[:year]
        json = ObituaryService.new.advanced_search_year(params[:year])
      end
    end
    json.map do |obituary_data|
      ApiObituary.new(obituary_data)
    end
  end

  def advanced_query_local(params)
    parse_params(params)
    binding.pry
  end

  def parse_params(params)
    query_params = {}
    params.each do |attribute, query|
      binding.pry
      if attribute == "name" && query != ""
        query_params[:name] = query
      elsif attribute == "year" && query != "0"
        query_params[:year] = query
      elsif attribute == "location" && query != ""
        query_params[:location] = query
      elsif attribute == "age" && query != "0"
        query_params[:age] = query
      end
    end
    query_params
  end
end
