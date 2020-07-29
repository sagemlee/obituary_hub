require "date"

class ApiObituary
  attr_reader :headline,
              :abstract,
              :web_url,
              :pub_date,
              :word_count,
              :image

  def initialize(info)

    @headline = info[:data][:attributes][:headline]
    @abstract = info[:data][:attributes][:abstract]
    @web_url = info[:data][:attributes][:web_url]
    @pub_date = format_date(info[:data][:attributes][:pub_date])
    @word_count = info[:data][:attributes][:word_count]
    @image = format_image(info[:data][:attributes][:image])
  end

  def format_date(date)
    date.split("T")[0].to_date.strftime("%B %-d, %Y")
  end

  def format_image(url)
    url ? "https://www.nytimes.com/".concat(url) : 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0013/5263/brand.gif?itok=MkqjUMfP'
  end
end
