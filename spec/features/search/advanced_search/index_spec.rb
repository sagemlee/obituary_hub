require "rails_helper"

describe "As a visitor" do
  it "I can search obituaries based on a variety of attributs", :vcr do

    user = create(:user)
    5.times do
      create(:obituary, user_id: user.id)
    end

    visit '/'

    click_on "Advanced Search Options"

    expect(current_path).to eq('/search/advanced')

    expect(page).to have_content("Name")
    expect(page).to have_content("Location")
    expect(page).to have_content("Age")
    expect(page).to have_content("Year")

    expect(page).to have_button("Search")
  end

  it "I can see the results from the NYT API", :vcr do

    visit '/search/advanced'

    fill_in :name, with: "George", id: "name_id"
    select 2019, from: :year
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

  xit "will render error if only one field is filled out" do
    visit '/'

    click_on "Advanced Search Options"

    expect(current_path).to eq('/search/advanced')


    within ".advanced_search" do
      click_on 'Search'
    end

    expect(current_path).to eq("/search/advanced")
    expect(page).to have_content("Please fill out name for NYT Search")
  end

  it "I can see the results for a year" do

    user = create(:user)
    obituary = Obituary.create!({
      first_name: "Bill",
      last_name: Faker::Name.last_name,
      age: Faker::Number.within(range: 45..110),
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      description: Faker::Lorem.paragraph(sentence_count: 15),
      image_url: Faker::Fillmurray.image,
      user_id: user.id
      })

    visit '/'

    click_on "Advanced Search Options"

    expect(current_path).to eq('/search/advanced')

    select 2020, from: :year
    within ".advanced_search" do
      click_on 'Search'
    end

    expect(current_path).to eq('/search/results')

    expect(page).to have_content(obituary.description)

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
end
