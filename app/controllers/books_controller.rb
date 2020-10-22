class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save(book_params)
    redirect_to books_path
  end

  def index
    @book = Book.all
  end


  def show
  end

  def edit
  end

  def update

  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
