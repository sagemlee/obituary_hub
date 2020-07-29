require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As a Visitor' do
    it 'I see a nav bar with links to specific indexes', :vcr do
      visit '/'

      within '#secondaryNav' do
        click_link 'COVID-19 Obituaries'
      end

      expect(current_path).to eq('/obituaries/covid-19')

      within '#mainNav' do
        find('#homepage').click
      end

      expect(current_path).to eq('/')

      within '#secondaryNav' do
        click_link 'Recently Published'
      end

      expect(current_path).to eq('/obituaries/recent')

      within '#secondaryNav' do
        click_link 'Additional Resources'
      end

      expect(current_path).to eq('/resources')

      within '#secondaryNav' do
        click_link 'Advanced Search'
      end

      expect(current_path).to eq('/search/advanced')
    end

    it 'I see buttons to login and register' do
      visit '/'

      expect(page).to have_content("Login")
      expect(page).to have_content("Sign Up")
    end
  end
end
