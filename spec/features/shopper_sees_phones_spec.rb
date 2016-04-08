require 'rails_helper'

feature "Shopper sees instock phones" do
  let!(:fake_os) { OperatingSystem.create(name: "Linusxyuntoows") }

  let(:fake_phone) { Phone.create(
  manufacturer: "Apple",
  screen_size: "Large",
  charging_port: "20mm",
  phone_name: "6s",
  quantity: 100
  )}

  let(:fake_phone2) { Phone.create(
  manufacturer: "Marblehead",
  screen_size: "Medium",
  charging_port: "10mm",
  phone_name: "Andriod",
  quantity: 0
  )}


  scenario "shopper sees instock phone" do
    visit phones_path
    fill_in "Manufacturer", with: fake_phone.manufacturer
    fill_in "Screen size", with: fake_phone.screen_size
    select fake_os.name, from: "Operating system"
    fill_in "Charging port", with: fake_phone.charging_port
    fill_in "Phone name", with: fake_phone.phone_name
    fill_in "Quantity", with: fake_phone.quantity
    click_on "Submit"
    expect(page).to have_content("instock")
  end

  scenario "shopper sees phone is not available" do
    visit phones_path
    fill_in "Manufacturer", with: fake_phone2.manufacturer
    fill_in "Screen size", with: fake_phone2.screen_size
    select fake_os.name, from: "Operating system"
    fill_in "Charging port", with: fake_phone2.charging_port
    fill_in "Phone name", with: fake_phone2.phone_name
    fill_in "Quantity", with: fake_phone2.quantity
    click_on "Submit"
    save_and_open_page

    expect(page).to have_content("not available")
  end
end
