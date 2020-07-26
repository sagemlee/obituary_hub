require "rails_helper"

describe "User logs in through facebook" do
    before(:each) do
        OmniAuth.config.mock_auth[:facebook] = nil

        OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
            {"provider"=>"facebook",
            "uid"=>"100626065081257",
            "info"=>
            {"email"=>"sharon_vzvvxsf_moidustein@tfbnw.net",
            "first_name"=>"Sharon",
            "last_name"=>"Moidustein",
            "image"=>"http://graph.facebook.com/v3.0/100626065081257/picture"},
            "credentials"=>
            {"token"=>
                "EAAqHzoceqSsBAN90pOElp2umzOEvZBNkOqtMzTL13oZBQMLpaZAH1QfXYanI9hLEmOsYvDhJOpYzEZCObeSagX8DOfiHx24yysYPfuiCjNccgCzZBnZApziZC7kZCPDUTVpqsfmNMWACdlLJeUZCmBXJ3y2j54LrZBZBz5dGliPYmd6RtGo6bv52P7GZBtmY3VmTCrAZD",
            "expires_at"=>1600736355,
            "expires"=>true},
            "extra"=>
            {"raw_info"=>
                {"id"=>"100626065081257",
                "first_name"=>"Sharon",
                "last_name"=>"Moidustein",
                "email"=>"sharon_vzvvxsf_moidustein@tfbnw.net"}
            }})
        end

  xit "logs in through registration page" do
        OmniAuth.config.test_mode = true

        first_name = "Sharon"
        last_name = "Moidustein"

        visit "/"
        click_on "Sign Up"
        expect(current_path).to eq("/users/new")
        find('#facebook_sign_in').click

        expect(current_path).to eq("/profile")
        expect(page).to have_content("You are now logged in as Sharon")
    end

    xit "logs in through login page" do
        OmniAuth.config.test_mode = true

        first_name = "Sharon"
        last_name = "Moidustein"

        visit "/"
        click_on "Login"
        expect(current_path).to eq("/login")
        find('#facebook_sign_in').click
        expect(current_path).to eq("/profile")
        expect(page).to have_content("You are now logged in as Sharon")
    end
end
