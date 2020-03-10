class BooksController < ApplicationController

  def index
  	@books = Book.all
    @book = Book.new
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
    @books = Book.all
  	if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "can't be blank"
      @books = Book.all
      render :index
    end
  end

  def edit
    @books = Book.all
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book)
    else
      book = Book.find(params[:id])
      render :index
    end
  end

def destroy
	book = Book.find(params[:id])
	if book.destroy
    flash[:delete] = "Book was successfully destroyed."
    redirect_to books_path
  else
    render :index
  end
end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
