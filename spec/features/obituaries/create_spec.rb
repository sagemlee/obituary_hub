require "rails_helper"

describe "As a registered user" do
  it "I can creat a new obituary"do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    first_name = 'New First Name'
    last_name = 'New Last Name'
    description = 'New Obituary Description'

    visit '/'

    click_link "Add Obituary"
    expect(current_path).to eq('/obituaries/new')

    fill_in :first_name, with: first_name
    fill_in :last_name, with: last_name
    fill_in :description, with: description
    fill_in :age, with: 100
    fill_in :city, with: 'Denver'
    fill_in :state, with: 'Colorado'
    fill_in :image_url, with: 'https://st.depositphotos.com/1763281/2304/i/950/depositphotos_23040102-stock-photo-smiling-man-with-thumbs-up.jpg'

    click_on "Create Obituary"

    obituary = Obituary.last
    expect(current_path).to eq("/obituaries/#{obituary.id}")
    expect(page).to have_content('Obituary Created')
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to have_content(description)
    expect(page).to have_content(obituary.age)
    expect(page).to have_content(obituary.city)
  end
end
