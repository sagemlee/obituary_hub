require "rails_helper"

describe "As a visitor" do
  it "I can search obituaries based on a variety of attributs" do

    user = create(:user)
    5.times do
      create(:obituary, user_id: user.id)
    end

    visit '/'

    click_on "Advanced Search Options"

    expect(current_path).to eq('/search/advanced')

    expect(page).to have_content("Name")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Age")
    expect(page).to have_content("Year")
    expect(page).to have_content("Source")

    expect(page).to have_button("Search")
  end

  it "I can see the results from the NYT API" do

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

  it "will render error if only one field is filed out" do
    visit '/'

    click_on "Advanced Search Options"

    expect(current_path).to eq('/search/advanced')


    within ".advanced_search" do
      click_on 'Search'
    end

    expect(current_path).to eq("/search/advanced")
    expect(page).to have_content("Please fill out name for NYT Search")
  end
end
