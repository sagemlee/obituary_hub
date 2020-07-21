require "rails_helper"

describe "User registration form" do
  it "Creates a new user" do

    first_name = "Tommy"
    last_name = "Johnson"
    email = "email@email.com"
    password = "password"

    visit "/users/new"

    fill_in :first_name, with: first_name
    fill_in :last_name, with: last_name

    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_verification, with: password

    click_on "Create User"

    expect(current_path).to eq("/profile")
    message = "Hello #{first_name} #{last_name}, thank
              you for creating an account"
    expect(page).to have_content(message)
  end


end
