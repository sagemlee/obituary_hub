require "rails_helper"

describe "As a registered user" do
  it "I can delete one of my obituaries"do
    user = create(:user)
    obituary = create(:obituary, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit obituary_path(obituary.id)
    click_link "Delete"

    expect(current_path).to eq("/profile")
    expect(page).to have_content("Obituary Deleted")
    expect(user.obituaries).to eq([])
  end

  it "I cannot edit another user's obituary" do
    user1 = create(:user)
    user2 = create(:user)
    obituary2 = create(:obituary, user_id: user2.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit obituary_path(obituary2.id)
    expect(page).to_not have_content("Delete")
  end
end

describe "As a visitor" do
  it "I see no link to delete" do
    obituary = create(:obituary)
    visit obituary_path(obituary.id)
    expect(page).to_not have_content("Delete")
  end
end
