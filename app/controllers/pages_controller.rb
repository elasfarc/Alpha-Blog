# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    redirect_to articles_path if logged_in?
  end

  def about; end

  def confirm_password; end
end
