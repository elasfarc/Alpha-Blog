require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    def setup
        @category = Category.new(name: 'Sports')
    end

    test 'category has a name field' do
        assert @category.name = 'Sports'
    end
    test 'category name should be present' do
        @category.name = ' '
        assert_not @category.valid?, 'name should be present'
    end
    test 'category name should be unique' do
        @category.save
        @category2 = Category.new(name: 'Sports')
        assert_not @category2.valid?, 'name should be unique'
    end
    test 'category name should be max length of 25' do
        @category.name = 'a' * 26
        assert_not @category.valid?
    end
    test 'category name should be minimum length of 3' do
        @category.name = 'a' * 2
        assert_not @category.valid?
    end
end