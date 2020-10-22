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
    @user = User.find_by(id: current_user.id)
    @book = Book.new
  end


  def show
    @book = Book.new
    @books = Book.find_by(id: params[:id])
    @user = User.find_by(id: @books.user_id)
  end

  def edit
  end

  def update

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
