require "rails_helper"

describe "As a visitor" do
  it "I can see obituaries for covid victims" do

    user = create(:user)
    obituary = create(:obituary, user_id: user.id)
    obituary.update({covid: true})

    obituary2 = create(:obituary, user_id: user.id)

    visit '/'

    click_on "COVID-19 Obituaries"

    expect(current_path).to eq('/obituaries/covid-19')

    expect(page).to have_content(obituary.first_name)
    expect(page).to have_content(obituary.description)
    expect(page).to_not have_content(obituary2.first_name)
    expect(page).to_not have_content(obituary2.description)
  end

  it "I can see the covid obituaries from the api", js: true do

    visit '/obituaries/covid-19'

    click_on 'View NYTimes Results'

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
end
