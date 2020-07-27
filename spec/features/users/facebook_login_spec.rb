require "rails_helper"

describe "User logs in through facebook" do

  it "logs in through registration page" do
        visit "/"
        click_on "Sign Up"
        expect(current_path).to eq("/users/new")
        click_link('Sign in with Facebook')

        expect(current_path).to eq("/profile")
        expect(page).to have_content("You are now logged in as Sharon")
    end

    it "logs in through login page" do
        visit "/"
        click_on "Login"
        expect(current_path).to eq("/login")

        click_link('Sign in with Facebook')

        expect(current_path).to eq("/profile")
        expect(page).to have_content("You are now logged in as Sharon")
    end

    it "logs in when user already has an account" do
      visit "/"
      click_on "Sign Up"
      click_link('Sign in with Facebook')
      click_link 'Logout'
      click_on 'Login'
      click_link('Sign in with Facebook')
      expect(page).to have_content("You are now logged in as Sharon")
    end
end
