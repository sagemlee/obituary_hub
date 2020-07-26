require "rails_helper"

describe "ObituaryService" do
  it "returns obituary hashes" do
    service  = ObituaryService.new
    obituaries = service.get_obituaries

    expect(obituaries).to be_a Array
    expect(obituaries.first).to be_a Hash

    expect(obituaries.first).to have_key :headline
    expect(obituaries.first).to have_key :abstract
  end
end
