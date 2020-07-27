require "rails_helper"

describe "User logs in through facebook" do

  it "logs in through registration page" do
        visit "/"
        click_on "Sign Up"
        expect(current_path).to eq("/users/new")
        click_link('Sign Up with Google')

        expect(current_path).to eq("/profile")
        expect(page).to have_content("You are now logged in as John")

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
        expect(page).to have_content("You are now logged in as John")
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
      expect(page).to have_content("You are now logged in as John")
    end

    it "has a sad path if the facebook login fails" do
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        "provider" => "google_oauth2",
        "uid" => "100000000000000000000",
        "info" => {
            "name" => "John Smith",
            "email" => nil,
            "first_name" => "John",
            "last_name" => "Smith",
            "image" => "https://lh4.googleusercontent.com/photo.jpg",
            "urls" => {
            "google" => "https://plus.google.com/+JohnSmith"
            }
        },
        "credentials" => {
            "token" => "TOKEN",
            "refresh_token" => "REFRESH_TOKEN",
            "expires_at" => 1496120719,
            "expires" => true
        },
        "extra" => {
            "id_token" => "ID_TOKEN",
            "id_info" => {
            "azp" => "APP_ID",
            "aud" => "APP_ID",
            "sub" => "100000000000000000000",
            "email" => "john@example.com",
            "email_verified" => true,
            "at_hash" => "HK6E_P6Dh8Y93mRNtsDB1Q",
            "iss" => "accounts.google.com",
            "iat" => 1496117119,
            "exp" => 1496120719
            },
            "raw_info" => {
            "sub" => "100000000000000000000",
            "name" => "John Smith",
            "given_name" => "John",
            "family_name" => "Smith",
            "profile" => "https://plus.google.com/+JohnSmith",
            "picture" => "https://lh4.googleusercontent.com/photo.jpg?sz=50",
            "email" => "john@example.com",
            "email_verified" => "true",
            "locale" => "en",
            "hd" => "company.com"
            }
        }
        })

      visit "/"
      click_on "Sign Up"
      click_link('Sign Up with Google')
      expect(current_path).to eq("/users/new")
      expect(page).to have_content("An Error has occured with Google")
    end
end
