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
  click_on "Login"
  expect(current_path).to eq("/login")

  fill_in :email, with: user.email
  fill_in :password, with: user.password

  click_on "Submit"

  expect(current_path).to eq("/profile")
  expect(page).to have_content("You are now logged in as #{user.first_name}")
  end

  it "visitor returns to login screen if bad email is entered" do
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
      expect(page).to have_content("The credentials you have entered are invalid")
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
      expect(page).to have_content("The credentials you have entered are invalid")
  end

  it "visitor leaves field blank" do
    user = User.create({
      first_name: "Bob",
      last_name: "Bobby",
      email: "jobbobby@bobby.com",
      password: "password",
      })

      visit '/login'

      fill_in :email, with: "jobbobby@bobby.com"


      click_on "Submit"

      expect(current_path).to eq("/login")
      expect(page).to have_content("The credentials you have entered are invalid")
  end

  it "can logout" do
    user = User.create({
      first_name: "Bob",
      last_name: "Bobby",
      email: "bobbobby@bobby.com",
      password: "password",
      })

  visit '/'
  expect(page).not_to have_content("Logout")
  click_on "Login"
  expect(current_path).to eq("/login")

  fill_in :email, with: user.email
  fill_in :password, with: user.password

  click_on "Submit"

  click_on "Logout"

  expect(current_path).to eq("/")
  expect(page).to have_content("You have logged out")
  expect(page).to have_content("Login")
  expect(page).not_to have_content("Logout")
  end


end
