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
    params = parse_params(params)
    if params.keys.include?(:name) && params.keys.include?(:year)
      json = ObituaryService.new.advanced_search_name_and_year(params[:name], params[:year])
    elsif params.keys.include?(:name) || params.keys.include?(:year)
      if params[:name]
        json = ObituaryService.new.get_obituaries_by_name(params[:name])
      elsif params[:year]
        json = ObituaryService.new.advanced_search_year(params[:year])
      end
    end
    if json.present?
      json.map do |obituary_data|
        ApiObituary.new(obituary_data)
      end
    end
  end

  def advanced_query_local(params)
    params = parse_params(params)
    query_results = []
    if params.keys.include?(:name)
      query_results << Obituary.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{params[:name]}%", "%#{params[:name]}%").pluck(:id)
    elsif params.keys.include?(:location)
      query_results << Obituary.where("city ILIKE ? OR state ILIKE ?", "%#{params[:location]}%", "%#{params[:location]}%").pluck(:id)
    elsif params.keys.include?(:age)
      query_results << Obituary.where("age = ?", "#{params[:age]}").pluck(:id)
    elsif params.keys.include?(:year)
      query_results << Obituary.where("extract(year from created_at) = ?", params[:year]).pluck(:id)
    end
    query_results.flatten.uniq
  end

  def parse_params(params)
    query_params = {}
    params.each do |attribute, query|
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
