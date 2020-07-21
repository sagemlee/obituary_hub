require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As a Visitor' do
    it 'I see a nav bar with links to specific indexes' do
      visit '/'

      within 'nav3' do
        click_link 'All Obituaries'
      end

      expect(current_path).to eq('/obituaries')

      within 'nav1' do
        click_link 'Obituary Hub'
      end

      expect(current_path).to eq('/')

      within 'nav3' do
        click_link 'COVID-19 Obituaries'
      end

      expect(current_path).to eq('/obituaries/covid-19')

      within 'nav3' do
        click_link 'Recently Published'
      end

      expect(current_path).to eq('/obituaries/recent')

      within 'nav3' do
        click_link 'Advanced Search'
      end

      expect(current_path).to eq('/obituaries/search/advanced')
    end

    it 'I see buttons to login and register' do
    end

  end

  describe 'As a logged in user' do
    it 'I see a button to logout' do

    end
  end
end
