require "rails_helper"

describe "As a visitor" do
  it "I can search obituaries based on a variety of attributs" do

    user = create(:user)
    5.times do
      create(:obituary, user_id: user.id)
    end

    visit '/'

    click_on "Advanced Search Options"

    expect(current_path).to eq('/search/advanced')

    expect(page).to have_content("Name")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Age")
    expect(page).to have_content("Year")
    expect(page).to have_content("Source")

    expect(page).to have_button("Search")
  end

end
