require "rails_helper"

describe "User logs in through facebook" do

  it "logs in through registration page" do
        visit "/"
        click_on "Sign Up"
        expect(current_path).to eq("/users/new")
        click_link('Sign Up with Google')

        expect(current_path).to eq("/profile")
        expect(page).to have_content("You are now logged in as Sharon")

        within("#logout") do
            click_link "Logout"
        end

        expect(current_path).to eq("/")
        expect(page).to have_content("You are now logged out")
        expect(page).to have_content("Login")
        expect(page).not_to have_content("Logout")
    end

    it "logs in through login page" do
        visit "/"
        click_on "Login"
        expect(current_path).to eq("/login")

        click_link('Sign in with Google')

        expect(current_path).to eq("/profile")
        expect(page).to have_content("You are now logged in as Sharon")
        within("#logout") do
            click_link "Logout"
        end

        expect(current_path).to eq("/")
        expect(page).to have_content("You are now logged out")
        expect(page).to have_content("Login")
        expect(page).not_to have_content("Logout")

    end

    it "logs in when user already has an account" do
      visit "/"
      click_on "Sign Up"
      click_link('Sign Up with Google')
      click_link 'Logout'
      click_on 'Login'
      click_link('Sign in with Google')
      expect(page).to have_content("You are now logged in as Sharon")
    end
end
