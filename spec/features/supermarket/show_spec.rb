require 'rails_helper'

RSpec.describe 'Supermarket show page' do
  it 'has a link to view all of the tiems that the supermakert has' do
    king = Supermarket.create!(name: "King Soopers", location: "Colorado Springs" )
    oreo = Item.create!(name: "Oreo", price: 2)
    cheese = Item.create!(name: "Cheese", price: 1)
    water = Item.create!(name: "Water", price: 1)
    milk = Item.create!(name: "Milk", price: 1)

    visit "/supermarkets/#{king.id}"
    expect(page).to have_content("King Soopers")
    expect(page).to have_content("Inventory")

  end

  it "goes to supermarket index page, list all of unique items" do
    king = Supermarket.create!(name: "King Soopers", location: "Colorado Springs" )
    oreo = Item.create!(name: "Oreo", price: 2)
    cheese = Item.create!(name: "Cheese", price: 1)
    water = Item.create!(name: "Water", price: 1)
    milk = Item.create!(name: "Milk", price: 1)

    visit "/supermarkets/#{king.id}"

    click_link "Inventory"

    expect(current_path).to eq("/supermarkets/#{king.id}/items")
    expect(page).to have_content("Oreo")
    expect(page).to have_content("Cheese")
    expect(page).to have_content("water")
    expect(page).to have_content("milk")

  end
end
