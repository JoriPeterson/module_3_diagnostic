require 'rails_helper'

describe 'User can search by zipcode' do
	it 'And see stations limited to electric and propane' do
		#Add webmock stub...

		visit '/'

		fill_in :q, with: "80203"
		click_on "Locate"

		expect(current_path).to eq('/search')
		expect(page).to have_css(".station", count: 10)
		within(first(".station")) do
			expect(page).to have_css(".name")
			expect(page).to have_css(".address")
			expect(page).to have_css(".fuel_types")
			expect(page).to have_css(".distance")
			expect(page).to have_css(".access_times")
		end
	end
end
