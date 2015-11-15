require "rails_helper"

feature "User visits Homepage" do
  scenario "succesfully" do
    visit root_path

    expect(page).to have_css 'h1', text: "Rails Trader"
  end
end
