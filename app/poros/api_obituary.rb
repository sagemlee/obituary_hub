class ApiObituary
  attr_reader :headline,
              :abstract,
              :web_url,
              :pub_date,
              :word_count
              
  def initialize(info)
    @headline = info[:data][:attributes][:headline]
    @abstract = info[:data][:attributes][:abstract]
    @web_url = info[:data][:attributes][:web_url]
    @pub_date = info[:data][:attributes][:pub_date]
    @word_count = info[:data][:attributes][:word_count]
  end
end
