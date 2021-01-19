require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test 'getting the new category form and successfully creating a category' do
    get '/categories/new'
    assert_response :success
    assert_difference('Category.count') do
      post categories_path, params: { category: { name: 'Travel' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Travel', response.body
  end
end


