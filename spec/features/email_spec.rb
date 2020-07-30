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
    fill_in :recipient_name, with: "bob"
    click_on "Send Email"

    email = ActionMailer::Base.deliveries.last
    expect(email.from).to have_content(["obituaryhub@gmail.com"])
    expect(email.to).to have_content(["bob@bob.com"])
    expect(email.text_part.body).to have_content("#{user.first_name} would like to share this obituary with you")

    expect(current_path).to eq("/obituaries/#{obit.id}")
    expect(page).to have_content("You Have Successfully Shared this Obituary in Email")
  end 

  it 'Cannot send email if not registered user' do 
    obit = create(:obituary)
    visit "obituaries/#{obit.id}"
    expect(page).to_not have_button('Share this Obituary in an Email')
    click_on 'Log in to send this Obituary in an Email'
    expect(current_path).to eq('/login')
  end 
end 

