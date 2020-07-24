require "rails_helper"

describe "User registration form" do
      before(:each) do 
    OmniAuth.config.mock_auth[:facebook] = nil 

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    "provider"=>"facebook",
 "uid"=>"100626065081257",
 "info"=>
  {"first_name"=>"Sharon",
   "last_name"=>"Moidustein",
   "image"=>"http://graph.facebook.com/v3.0/100626065081257/picture"},
 "credentials"=>
  {"token"=>
    "EAAqHzoceqSsBAGIneUmXivWhPdw6SrJZAEniURTPOWihCNGEKAWAK25MhInQa5KGwd2bu8n9fgqQVJUcdWPbws8BIYfs26NOebEbmuVhzTegCCyDl1Fa6L8vxUH6GUYZCwsO2vC2E1gHAwuVHLAkN6RFbeeELy6ODlXl467CPDEe6HG1mGP7eb1Cks59kZD",
   "expires_at"=>1600736356,
   "expires"=>true},
 "extra"=>
  {"raw_info"=>{"id"=>"100626065081257", "first_name"=>"Sharon", "last_name"=>"Moidustein"}}}


  end
  it "Creates a new user through facebook authentication" do

    first_name = "Sharon"
    last_name = "Moidustein"
    email = "sharon_vzvvxsf_moidustein@tfbnw.net"
    password = "obit123"

    visit "/"
    click_on "Register"
    expect(current_path).to eq("/users/new")
    click_on "Connect through Facebook"
   # expect(current_path).to eq("/auth/facebook")

    expect(current_path).to eq("/profile")

    expect(page).to have_content("Hello #{first_name} #{last_name}, thank you for creating an account")
  end




end
