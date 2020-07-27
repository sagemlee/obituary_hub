require "rails_helper"

describe "User logs in through facebook" do

  it "logs in through registration page" do
        visit "/"
        click_on "Sign Up"
        expect(current_path).to eq("/users/new")
        click_link('Sign Up with Facebook')

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

        click_link('Sign in with Facebook')

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
      click_link('Sign Up with Facebook')
      click_link 'Logout'
      click_on 'Login'
      click_link('Sign in with Facebook')
      expect(page).to have_content("You are now logged in as Sharon")
    end

    it "has a sad path if the facebook login fails" do
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
          {"provider"=>"facebook",
          "uid"=>"100626065081257",
          "info"=>
          {"first_name"=>"Sharon",
          "last_name"=>"Moidustein",
          "image"=>"http://graph.facebook.com/v3.0/100626065081257/picture"},
          "credentials"=>
          {"token"=>
              "EAAqHzoceqSsBAN90pOElp2umzOEvZBNkOqtMzTL13oZBQMLpaZAH1QfXYanI9hLEmOsYvDhJOpYzEZCObeSagX8DOfiHx24yysYPfuiCjNccgCzZBnZApziZC7kZCPDUTVpqsfmNMWACdlLJeUZCmBXJ3y2j54LrZBZBz5dGliPYmd6RtGo6bv52P7GZBtmY3VmTCrAZD",
          "expires_at"=>1600736355,
          "expires"=>true}
          })
      visit "/"
      click_on "Sign Up"
      click_link('Sign Up with Facebook')
      expect(current_path).to eq("/users/new")
      expect(page).to have_content("An Error has occured with")
    end
end
