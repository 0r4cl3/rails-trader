require 'rails_helper'

feature "User visits Candle Page" do
  scenario "sucessfully" do
    visit candles_path

    expect(page).to have_css 'h1', text: "Candles"

    select 'AUD_CAD', from: "indicators"
    click_on 'Get Candles'

    expect(page).to have_css "h3", text: "Candle"
  end
end
