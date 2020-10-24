class BooksController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def correct_user
    book = Book.find_by(id: params[:id])
    user = User.find_by(id: book.user_id)
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save(book_params)
      flash[:success] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      @user = User.find_by(id: @book.user_id)
      @books = Book.all
      render :index
    end
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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "You have creatad book successfully."
      redirect_to book_path(user_id: current_user.id)
    else
      render :edit
    end

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
