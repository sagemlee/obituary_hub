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
end
