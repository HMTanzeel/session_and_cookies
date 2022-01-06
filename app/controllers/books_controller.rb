class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      @books = Book.all
      flash.now[:alert] = "Your book was not found"
      render "index"
    end
  end  

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to (@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
