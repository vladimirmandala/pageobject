Given(/^We wish to enter a new product$/) do
  @product_page = ProductPage.new(@browser)
  visit_page ProductPage
  #click_link 'New Product'
end

When(/^The following product is entered$/) do |table|
  data = table.rows_hash
  @product_page.title = data['title']
  @product_page.description = data['description']
  @product_page.create_product
end
Then(/^I should see the product listed$/) do |table|
  data = table.rows_hash
  @product_page.text.should have_content('Product was successfully created')
  @product_page.text.should have_content(data['title'])
  @product_page.text.should have_content(data['description'])
end
