class BooksController < ApplicationController
  def new
    @post_book = Book.new
  end

  def create
    @post_book = Book.new(book_params)
    @post_book.user_id = current_user.id
    if @post_book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@post_book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book_update = Book.find(params[:id])
    if @book_update.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book_update.id)
    else
      @book = Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    @post_book = Book.find(params[:id])
    @post_book.destroy
    redirect_to books_path
  end

  def index
    @books = Book.all
    @post_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_n = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
