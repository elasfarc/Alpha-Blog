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

  test 'get the new category form and reject invalid category submission ' do
    get '/categories/new'
    assert_response :success
    assert_no_difference('Category.count') do 
      post categories_path, params: {category: {name: ' '}}
    end
    assert_match 'prevented', response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end


