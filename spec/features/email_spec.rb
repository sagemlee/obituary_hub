require 'rails_helper'

RSpec.describe 'User can send emails' do
  it 'From obituary show page' do  

    user = create(:user)
    obit = create(:obituary)

    visit '/'
    click_on "Login"

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    find('#submit').click

    visit "obituaries/#{obit.id}"

    click_on 'Share this Obituary in an Email'
    expect(current_path).to eq("/obituaries/#{obit.id}/share")

    fill_in :recipient_email, with: "bob@bob.com"
    click_on "Send Email"

    expect(current_path).to eq("obituaries/#{obit.id}")
    expect(page).to have_content("You Have Successfully Shared this Obituary in Email")
  end 
end 




# As a registered user
# When I visit an obituary show page
# And I click "Send in Email"
# Then I should be on 'obituaries/id/share'

# And when I fill in "Email" with
# And I click on "Send in Email"
# Then I should be on /dashboard
# And I should see a message that says "Successfully shared obituary in email"

# Hello,

# <Sender's name as it appears in database or on facebook> has shared a published obituary from Obituary Hub. You can view the post <here (should be a link to obituary)>.