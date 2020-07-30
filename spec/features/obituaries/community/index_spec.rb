require "rails_helper"

describe "As a visitor" do
  it "I can see obituaries submitted by our user community" do

    user = create(:user)
    obituary = create(:obituary, user_id: user.id)
    obituary2 = create(:obituary, user_id: user.id)
    obituary3 = create(:obituary, user_id: user.id)

    visit '/'

    click_on "Community Obituaries"

    expect(current_path).to eq('/obituaries/community')
    
    expect(page).to have_content(obituary.first_name)
    expect(page).to have_content(obituary.description.first(200))
    expect(page).to have_content(obituary2.first_name)
    expect(page).to have_content(obituary2.description.first(200))
    expect(page).to have_content(obituary3.first_name)
    expect(page).to have_content(obituary3.description.first(200))
  end
end
