class BooksController < ApplicationController
  before_action :set_shelf
  before_action :set_shelf_book, only: [:show, :update, :destroy]

  # GET /shelves/:shelf_id/books
  def index
    json_response(@shelf.books)
  end

  # GET /shelves/:shelf_id/books/:id
  def show
    json_response(@book)
  end

  # POST /shelves/:shelf_id/books
  def create
    @shelf.books.create!(book_params)
    json_response(@shelf, :created)
  end

  # PUT /shelves/:shelf_id/books/:id
  def update
    @book.update(book_params)
    head :no_content
  end

  # DELETE /shelves/:shelf_id/books/:id
  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params
    params.permit(:title, :rate, :author, :shelf_id, :genre, :publisher)
  end

  def set_shelf
    @shelf = Shelf.find(params[:shelf_id])
  end

  def set_shelf_book
    @book = @shelf.books.find_by!(id: params[:id]) if @shelf
  end
end
