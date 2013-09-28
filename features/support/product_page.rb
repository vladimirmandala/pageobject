class ProductPage
  include PageObject

  page_url('http://localhost:3000/products/new')

  text_field(:title, :id => 'product_title')
  text_field(:description, :id => 'product_description')
  text_field(:price, :id => 'product_price')
  button(:create_product, :name => 'commit')
end