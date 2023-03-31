# frozen_string_literal: true

# HomeController
class HomeController < ApplicationController
  include PublicAccessibleController

  def index; end

  def feed
    @books = Book.all.joins(:author)
  end
end
