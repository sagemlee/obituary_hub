require "rails_helper"

describe "ObituaryService" do
  it "returns obituary hashes", :vcr do
    service  = ObituaryService.new
    obituaries = service.get_obituaries

    expect(obituaries).to be_a Array
    expect(obituaries.first).to be_a Hash

    expect(obituaries.first[:data][:type]).to eq('obituary')
    expect(obituaries.first[:data][:attributes]).to have_key :headline
  end

  it "returns covid obituaries", :vcr do
    service  = ObituaryService.new
    obituaries = service.get_covid_obituaries

    expect(obituaries).to be_a Array
    expect(obituaries.first).to be_a Hash

    expect(obituaries.first[:data][:attributes][:abstract].downcase.include?('coronavirus') || obituaries.first[:data][:attributes][:abstract].downcase.include?('covid')).to eq(true)
  end

  it "returns recent obituaries", :vcr do
    service = ObituaryService.new
    obituaries = service.get_recent_obituaries

    expect(obituaries).to be_a Array
    expect(obituaries.first).to be_a Hash

    expect(obituaries.first[:data][:type]).to eq('obituary')
  end

  it "returns advanced obituaries", :vcr do
    service = ObituaryService.new
    name = "George"
    year = 2019
    obituaries = service.advanced_search_name_and_year(name, year)

    expect(obituaries).to be_a Array
    expect(obituaries.first).to be_a Hash
    expect(obituaries.first[:data][:type]).to eq('obituary')
    expect(obituaries.first[:data][:attributes][:headline].include?('George'))
  end

  it "returns obituaries by name", :vcr do
    service = ObituaryService.new
    name = "George"
    obituaries = service.get_obituaries_by_name(name)
    expect(obituaries).to be_a Array
    expect(obituaries.first).to be_a Hash
    expect(obituaries.first[:data][:type]).to eq('obituary')
    expect(obituaries.first[:data][:attributes][:headline].include?('George'))
  end
end
