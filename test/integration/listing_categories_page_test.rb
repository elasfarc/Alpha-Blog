require "test_helper"

class ListingCategoriesPageTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'Sports' )
    @category2 = Category.create(name: 'Travel' )
  end
  test 'should show categories listing page' do
    get '/categories'
    assert_response :success
    assert_select 'a[href = ?]', category_path(@category), text: @category.name
    assert_select 'a[href=?]', category_path(@category2), text: @category2.name
  end
end
