require 'rails_helper'

feature "Dealer adds Phone OS" do
  let(:fake_os) { "Linusxyuntoows" }

  scenario "dealer adds phone os" do
    visit root_path

    fill_in "Name", with: fake_os
    click_on "Submit"

    expect(page.current_path).to eq operating_systems_path
    expect(page).to have_content fake_os
  end
end
