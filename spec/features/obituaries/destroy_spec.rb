require "rails_helper"

describe "As a registered user" do
  it "I can delete one of my obituaries"do
    user = create(:user)
    obituary = create(:obituary, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit obituary_path(obituary.id)
    click_link "Delete"

    expect(current_path).to eq("/")
    expect(page).to have_content("Obituary Deleted")
    expect(user.obituaries).to eq([])
  end
end
