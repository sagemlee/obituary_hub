require "rails_helper"

describe "User Profile Page" do
  it "Displays user's obituaries and account information" do
    user = create(:user)
    obit1 = create(:obituary, user_id: user.id)
    obit2 = create(:obituary, user_id: user.id)
    obit3 = create(:obituary, user_id: user.id)
    obit4 = create(:obituary)

    visit '/'
    click_on "Login"
    expect(current_path).to eq("/login")

    fill_in :email, with: user.email
    fill_in :password, with: user.password
      
    find('#submit').click

    within '#mainNav' do
      find('#homepage').click
    end

    within '#mainNav' do
      find('#profile').click
    end

    expect(current_path).to eq("/profile")
    expect(page).to have_content("First Name: #{user.first_name}")
    expect(page).to have_content("Last Name: #{user.last_name}")
    expect(page).to have_content("Email: #{user.email}")

    expect(page).to have_css("#obit-#{obit1.id}")
    expect(page).to have_css("#obit-#{obit2.id}")
    expect(page).to have_css("#obit-#{obit3.id}")
    expect(page).to_not have_css("#obit-#{obit4.id}")

    within("#obit-#{obit1.id}") do 
      find(".card-link").click
    end
    expect(current_path).to eq("/obituaries/#{obit1.id}")

  end 
end 