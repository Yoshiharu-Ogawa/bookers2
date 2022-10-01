class BooksController < ApplicationController
  def new
    @post_book = Book.new
  end

  def create
    @post_book = Book.new(book_params)
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to book_path(@post_book.id)
  end

  def destroy
    @post_book = Book.find(params[:id])
    @post_book.destroy
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
