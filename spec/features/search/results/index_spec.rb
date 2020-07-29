require "rails_helper"

describe "As a visitor" do
  it "I can see the results from the NYT API for search with name and year", :vcr do
    visit '/search/advanced'

    fill_in "Search by Name", with: "George", id: "name_id"
    select 2019, from: "Year"
    within ".advanced_search" do
      click_on 'Search'
    end

    within(first("#obituary_by_name")) do
      expect(page).to have_css("#headline")
      headline = find("#headline").text
      expect(headline).not_to be_empty

      expect(page).to have_css("#abstract")
      abstract = find("#abstract").text
      expect(abstract).not_to be_empty

      expect(page).to have_css("#web_url")
      web_url = find("#web_url").text
      expect(web_url).not_to be_empty

      expect(page).to have_css("#pub_date")
      pub_date = find("#pub_date").text
      expect(pub_date).not_to be_empty

      expect(page).to have_css("#word_count")
      word_count = find("#word_count").text
      expect(word_count).not_to be_empty

      expect(page).to have_css("#image")
    end
  end

  it "I can see the results from NYT for just a year", :vcr do
    visit '/'

    click_on "Advanced Search Options"

    expect(current_path).to eq('/search/advanced')

    select 2020, from: "Year"
    within ".advanced_search" do
      click_on 'Search'
    end

    expect(current_path).to eq('/search/results')

    within(first(".advanced_obituary")) do

      expect(page).to have_css(".headline")
      headline = find(".headline").text
      expect(headline).not_to be_empty

      expect(page).to have_css(".abstract")
      abstract = find(".abstract").text
      expect(abstract).not_to be_empty

      expect(page).to have_css(".web_url")
      web_url = find(".web_url").text
      expect(web_url).not_to be_empty

      expect(page).to have_css(".pub_date")
      pub_date = find(".pub_date").text
      expect(pub_date).to have_content("2019")

      expect(page).to have_css(".word_count")
      word_count = find(".word_count").text
      expect(word_count).not_to be_empty

      expect(page).to have_css(".image")
      image = find(".image").text
      expect(image).not_to be_empty
    end
  end

    it "I can see the results for a locaton" do
      user = create(:user)
      obituary = Obituary.create!({
        first_name: "Bill",
        last_name: Faker::Name.last_name,
        age: Faker::Number.within(range: 45..110),
        city: "Atlanta",
        state: Faker::Address.state_abbr,
        description: Faker::Lorem.paragraph(sentence_count: 15),
        image_url: Faker::Fillmurray.image,
        user_id: user.id
        })

      visit '/'

      click_on "Advanced Search Options"

      expect(current_path).to eq('/search/advanced')

      fill_in :location, with: "Atlanta"

      within ".advanced_search" do
        click_on 'Search'
      end

      expect(current_path).to eq('/search/results')

      expect(page).to have_content(obituary.description)
    end

    it "I can see the result for an age" do
      user = create(:user)
      obituary = Obituary.create!({
        first_name: "Bill",
        last_name: Faker::Name.last_name,
        age: "85",
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        description: Faker::Lorem.paragraph(sentence_count: 15),
        image_url: Faker::Fillmurray.image,
        user_id: user.id
        })

      visit '/'

      click_on "Advanced Search Options"

      expect(current_path).to eq('/search/advanced')

      select 85, from: "Age"
      within ".advanced_search" do
        click_on 'Search'
      end

      expect(current_path).to eq('/search/results')

      expect(page).to have_content(obituary.description)
    end

    it "I can see the results for multiple fields" do
      user = create(:user)
      obituary = Obituary.create!({
        first_name: "Bill",
        last_name: Faker::Name.last_name,
        age: "85",
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        description: Faker::Lorem.paragraph(sentence_count: 15),
        image_url: Faker::Fillmurray.image,
        user_id: user.id
        })

      visit '/'

      click_on "Advanced Search Options"

      expect(current_path).to eq('/search/advanced')

      select 2020, from: "Year"
      fill_in "Search by Name", with: "Bill", id: "name_id"
      select 85, from: "Age"

      within ".advanced_search" do
        click_on 'Search'
      end

      expect(current_path).to eq('/search/results')

      expect(page).to have_content(obituary.description)
    end
  end
