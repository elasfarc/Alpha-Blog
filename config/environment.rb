# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#git rid of fields_with_errors div
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end
