require 'rails_helper'

feature "Dealer adds phone model" do
  let!(:fake_os) { OperatingSystem.create(name: "Linusxyuntoows") }

  let(:fake_phone) { Phone.create(
  manufacturer: "Apple",
  screen_size: "Large",
  charging_port: "20mm",
  phone_name: "6s",
  quantity: 100
  )}

  scenario "dealer adds phone model" do
    visit phones_path

    fill_in "Manufacturer", with: fake_phone.manufacturer
    fill_in "Screen size", with: fake_phone.screen_size
    select fake_os.name, from: "Operating system"
    fill_in "Charging port", with: fake_phone.charging_port
    fill_in "Phone name", with: fake_phone.phone_name
    fill_in "Quantity", with: fake_phone.quantity
    click_on "Submit"

    expect(page.current_path).to eq phones_path
    expect(page).to have_content fake_phone.manufacturer
    expect(page).to have_content fake_phone.screen_size
    expect(page).to have_content fake_os.name
    expect(page).to have_content fake_phone.charging_port
    expect(page).to have_content fake_phone.phone_name
    expect(page).to have_content fake_phone.quantity
    expect(page).to have_content("Phone Successfully Added!")
  end

  scenario "dealer adds form with missing field" do
    visit phones_path

    fill_in "Manufacturer", with: ""
    fill_in "Screen size", with: ""
    select fake_os.name, from: "Operating system"
    fill_in "Charging port", with: ""
    fill_in "Phone name", with: ""
    fill_in "Quantity", with: ""
    click_on "Submit"

    expect(page.current_path).to eq phones_path
    expect(page).to_not have_content fake_phone.manufacturer
    expect(page).to have_content("Charging port can't be blank")
  end

  scenario "dealer adds form with missing field" do
    visit phones_path

    fill_in "Manufacturer", with: ""
    fill_in "Screen size", with: ""
    select fake_os.name, from: "Operating system"
    fill_in "Charging port", with: ""
    fill_in "Phone name", with: ""
    fill_in "Quantity", with: -1
    click_on "Submit"

    expect(page.current_path).to eq phones_path
    expect(page).to have_content("Quantity must be greater than or equal to 0")
  end
end
