require "rails_helper"

describe "As a registered user" do
  it "I can create a new obituary"do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    first_name = 'New First Name'
    last_name = 'New Last Name'
    description = 'New Obituary Description'

    visit '/'

    click_link "Add Obituary"
    expect(current_path).to eq('/obituaries/new')

    fill_in 'obituary[first_name]', with: first_name
    fill_in 'obituary[last_name]', with: last_name
    fill_in 'obituary[description]', with: description
    within '#age-select' do
      page.select(100)
    end
    fill_in 'obituary[city]', with: 'Denver'
    within '#state-select' do
      page.select('CO')
    end
    fill_in 'obituary[image_url]', with: 'https://st.depositphotos.com/1763281/2304/i/950/depositphotos_23040102-stock-photo-smiling-man-with-thumbs-up.jpg'

    click_on "Create Obituary"

    obituary = Obituary.last
    expect(current_path).to eq("/obituaries/#{obituary.id}")
    expect(page).to have_content('New obituary was successfully created.')
    expect(page).to have_content(first_name)
    expect(page).to have_content(last_name)
    expect(page).to have_content(description)
    expect(page).to have_content(obituary.age)
    expect(page).to have_content(obituary.city)
    expect(page).to have_content(obituary.state)
    expect(page).to have_css('#obituary-image')
  end

  it "I can create a new obituary for covid" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    first_name = 'New First Name'
    last_name = 'New Last Name'
    description = 'New Obituary Description'

    visit '/'

    click_link "Add Obituary"
    expect(current_path).to eq('/obituaries/new')

    fill_in 'obituary[first_name]', with: first_name
    fill_in 'obituary[last_name]', with: last_name
    fill_in 'obituary[description]', with: description
    within '#age-select' do
      page.select(100)
    end
    within '#covid-select' do
      page.check("COVID-19")
    end

    fill_in 'obituary[city]', with: 'Denver'
    within '#state-select' do
      page.select('CO')
    end
    fill_in 'obituary[image_url]', with: 'https://st.depositphotos.com/1763281/2304/i/950/depositphotos_23040102-stock-photo-smiling-man-with-thumbs-up.jpg'

    click_on "Create Obituary"

    obituary = Obituary.last
    expect(current_path).to eq("/obituaries/#{obituary.id}")
    expect(page).to have_content('New obituary was successfully created.')
    expect(page).to have_content("COVID-19")

  end

  it "I must fill in first and last name when creating a obituary"do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    click_link "Add Obituary"

    click_on "Create Obituary"

    expect(page).to have_content("First name can't be blank and Last name can't be blank")
  end

  it "can enter an obituary over 200 characters, but it will only display full length on show page", :vcr do 
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    obit = create(:obituary, user_id: user.id, description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')

    visit "/obituaries/#{obit.id}" 

    within (".description") do 
      expect(page).to have_content('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
    end 

    visit obituaries_recent_path
    within (".obit-#{obit.id}") do
      expect(page).to have_content("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a")
      expect(page).to_not have_content('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
    end
  end 
end

describe "As a visitor" do
  it "I see no link to add an obituary" do
    visit '/'
    expect(page).to_not have_content("Add Obituary")
  end

  it "I cannot access the obituary create form" do
    obituary = create(:obituary)
    visit new_obituary_path(obituary.id)
    expect(page).to have_content("The page you are looking for does not exist")
  end
end
