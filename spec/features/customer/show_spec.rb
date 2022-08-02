require 'rails_helper'


RSpec.describe 'customer show page' do
  it 'shows a list of its items and the name of the supermarket it belongs to' do
    king = Supermarket.create!(name: "King Soopers", location: "Colorado Springs" )
    carl = Customer.create!(name: "Carl", supermarket_id: "#{king.id}")
    oreo = Item.create!(name: "Oreo", price: 2)
    cheese = Item.create!(name: "Cheese", price: 1)


    customer_item1 = CustomerItem.create!(item_id: "#{oreo.id}", customer_id: "#{carl.id}")
    customer_item2 = CustomerItem.create!(item_id: "#{cheese.id}", customer_id: "#{carl.id}")

    visit "/customers/#{carl.id}"
    expect(page).to have_content("Oreo")
    expect(page).to have_content("Cheese")
    expect(page).to_not have_content("Water")
  end

  it 'shows a total price for all its items' do
    king = Supermarket.create!(name: "King Soopers", location: "Colorado Springs" )
    aldi = Supermarket.create!(name: "Aldis", location: "Colorado Springs" )
    carl = Customer.create!(name: "Carl", supermarket_id: "#{king.id}")
    oreo = Item.create!(name: "Oreo", price: 2)
    cheese = Item.create!(name: "Cheese", price: 1)



    customer_item1 = CustomerItem.create!(item_id: "#{oreo.id}", customer_id: "#{carl.id}")
    customer_item2 = CustomerItem.create!(item_id: "#{cheese.id}", customer_id: "#{carl.id}")

    visit "/customers/#{carl.id}"


    expect(page).to have_content("Total: $3.00")
    expect(page).to_not have_content("Total: $1.00")
  end
end
