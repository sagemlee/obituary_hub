require "rails_helper"

describe "Visitor Login Page" do
  it "visitor can login if correct infomation is entered " do
    user = User.create({
      first_name: "Bob",
      last_name: "Bobby",
      email: "bobbobby@bobby.com",
      password: "password",
      })

  visit '/'

  # within ".login" do
    click_on "Login"
  # end
  expect(current_path).to eq("/login")

  fill_in :email, with: user.email
  fill_in :password, with: user.password

  click_on "Submit"

  expect(current_path).to eq("/profile")
  expect(page).to have_content("You are now logged in as #{user.first_name}")
  end

  it "visitor returns to login screen if bad email in entered" do
    user = User.create({
      first_name: "Bob",
      last_name: "Bobby",
      email: "bobbobby@bobby.com",
      password: "password",
      })

      visit '/login'

      fill_in :email, with: "Hello"
      fill_in :password, with: "password"

      click_on "Submit"

      expect(current_path).to eq("/login")
      expect(page).to have_content("The credentitals you have entered are invalid")
  end

  it "visitor recieves error if bad password is entered" do
    user = User.create({
      first_name: "Bob",
      last_name: "Bobby",
      email: "jobbobby@bobby.com",
      password: "password",
      })

      visit '/login'

      fill_in :email, with: "jobbobby@bobby.com"
      fill_in :password, with: "hi"

      click_on "Submit"

      expect(current_path).to eq("/login")
      expect(page).to have_content("The credentitals you have entered are invalid")
  end

  it "visitor leaves field blank"


end
