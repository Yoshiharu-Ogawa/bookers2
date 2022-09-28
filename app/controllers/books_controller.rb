class BooksController < ApplicationController
  def new
    @post_book = Book.new
  end

  def create
    @post_book = Book.new(book_params)
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to book_path(params[:id])
  end

  def index
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end
end
