require "rails_helper"

describe "As a visitor" do
  it "I can see obituaries for covid victims" do

    user = create(:user)
    obituary = create(:obituary, user_id: user.id)
    obituary.update({covid: true})

    obituary2 = create(:obituary, user_id: user.id)

    visit '/'

    click_on "COVID-19 Obituaries"

    expect(current_path).to eq('/obituaries/covid-19')

    expect(page).to have_content(obituary.first_name)
    expect(page).to have_content(obituary.description)
    expect(page).to_not have_content(obituary2.first_name)
    expect(page).to_not have_content(obituary2.description)
  end
end
