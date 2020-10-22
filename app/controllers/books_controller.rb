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
    @books = Book.all
  end


  def show
    @book = Book.find(params[:id])
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
