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

  it "I must fill in required fields to edit and obituary"do
    user = create(:user)
    obituary = create(:obituary, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit obituary_path(obituary.id)
    click_link "Edit"
    fill_in 'obituary[first_name]', with: ''
    fill_in 'obituary[last_name]', with: ''

    click_on "Update Obituary"

    expect(page).to have_content("First name can't be blank and Last name can't be blank")
  end

  it "I cannot edit another user's obituary" do
    user1 = create(:user)
    obituary1 = create(:obituary, user_id: user1.id)
    user2 = create(:user)
    obituary2 = create(:obituary, user_id: user2.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit obituary_path(obituary2.id)
    expect(page).to_not have_content("Edit")
    visit edit_obituary_path(obituary2.id)
    expect(page).to have_content('The page you were looking for doesn\'t exist (404)')
  end
end

describe "As a visitor" do
  it "I see no link to edit" do
    obituary = create(:obituary)
    visit obituary_path(obituary.id)
    expect(page).to_not have_content("Edit")
  end

  it "I cannot access the obituary edit form" do
    obituary = create(:obituary)
    visit edit_obituary_path(obituary.id)
    expect(page).to have_content('The page you were looking for doesn\'t exist (404)')
  end
end
