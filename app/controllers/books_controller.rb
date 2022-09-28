class BooksController < ApplicationController
  def new
    @post_book = Book.new
  end

  def create
    @post_book = Book.new
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to book_path(current_user)
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end
end
