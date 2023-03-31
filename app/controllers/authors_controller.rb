# frozen_string_literal: true

# AuthorControllers
class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(create_author_params)

    if @author.save
      redirect_to params[:return_to] if params[:return_to].present?

      redirect_to new_book_path
    else
      redirect_to action: :new, status: :unprocessable_entity
    end
  end

  private

  def create_author_params
    params.require(:author).permit(:name, :birthdate)
  end
end
