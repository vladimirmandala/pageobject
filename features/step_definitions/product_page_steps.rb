Given(/^We wish to enter a new product$/) do
  visit ProductPage
end

Given(/^We are viewing the product listing$/) do
  visit ProductPageList
end

Given(/^A handful of products$/) do |table|
  products = table.hashes
  start = Product.count
  products.each do |product|
    p = Product.create(product)
  end
  #puts "Created #{Product.count - start} new products"
  #puts Product.all.each {|p| puts p.title}
end

When(/^The following product is entered$/) do |table|
  data = table.rows_hash
  on(ProductPage) do |page|
    page.title = data['title']
    page.description = data['description']
    page.create_product
  end
end

Then(/^I should see the product listed$/) do |table|
  data = table.rows_hash
  on(ProductPageList) do |page|
    page.text.should have_content('Product was successfully created')
    page.text.should have_content(data['title'])
    page.text.should have_content(data['description'])
  end
end

Then(/^I should see the products$/) do |table|
  products = table.hashes
  on(ProductPageList) do |page|
    products.each do |product|
      page.text.should have_content(product['title'])
      page.text.should have_content(product['description'])
    end
  end
end
