require "rails_helper"

describe "As a registered user" do
  it "I can edit one of my obituaries"do
    user = create(:user)
    obituary = create(:obituary, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    first_name = 'New First Name'
    last_name = 'New Last Name'
    description = 'New Obituary Description'

    visit obituary_path(obituary.id)

    click_link "Edit"
    expect(current_path).to eq("/obituaries/#{obituary.id}/edit")

    fill_in 'obituary[first_name]', with: first_name
    fill_in 'obituary[last_name]', with: last_name
    fill_in 'obituary[description]', with: description

    click_on "Update Obituary"

    expect(current_path).to eq("/obituaries/#{obituary.id}")
    expect(page).to have_content('Obituary Updated')
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to have_content(description)
  end

end
