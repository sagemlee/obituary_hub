require "rails_helper"

describe "Search index page" do
  it "can enter a name and show all obituaries with that name" do

    visit "/"
    within "form#search_form" do
      fill_in :name, with: "George"
      click_on "Search"
    end

    expect(current_path).to eq("/search")

    within(first(".obituary_by_name")) do

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
      expect(pub_date).not_to be_empty

      expect(page).to have_css(".word_count")
      word_count = find(".word_count").text
      expect(word_count).not_to be_empty
    end
  end
end
