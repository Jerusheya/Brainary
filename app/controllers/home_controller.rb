# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def book
    @cat = Category.all
    @list = Book.all
    @review = Review.all
  end

  def new_donate; end

  def category; end

  def add_category
    @categories = Category.new(category_params)

    render plain: 'Success' if @categories.save
  end

  def book_create
    @books = Book.new(book_params)
    @books.book_pic.attach(book_params[:book_pic])
    @category = Category.find_by_category_name(params[:book][:category])
    @books.categories_id = @category.id

    render plain: 'Success' if @books.save
  end

  def donate_books; end

  def booklist_showing
    @list = Book.all
  end

  def suggestBook_list
    @suggestlist = SuggestBook.all
  end

  def donatelist_showing
    @donatelist = DonateBook.all
  end

  def schedule
    @list = Book.all
  end

  def schedule_post
    @schedule_inputs = ScheduleTime.new(schedule_params)
    @schedule_inputs[:users_id] = current_user.id
    @booklists = Book.find_by_name(params[:schedule_times][:book_name_id])
    @schedule_inputs.books_id = @booklists.id
    redirect_to '/schedule' if @schedule_inputs.save
  end

  def create_review
    @review = Review.new(review_params)
    @review[:users_id] = current_user.id
    redirect_to '/book' if @review.save
  end

  def create_donate
    @donatinglist = DonateBook.new(donate_params)
    render 'donate_books' if @donatinglist.save
  end

  def suggestingbooks
    @suggest = SuggestBook.new(suggest_books_params)
    render 'donate_books' if @suggest.save
  end

  private

  def donate_params
    params.require(:donate_books).permit(:user_name, :mobile, :book_name, :language, :address)
  end

  def review_params
    params.require(:review).permit(:review_description, :review, :books_id)
  end

  def book_params
    params.require(:book).permit(:book_pic, :name, :author, :description, :language)
  end

  def category_params
    params.require(:categories).permit(:category_name)
  end

  def suggest_books_params
    params.require(:suggest_books).permit(:option, :name)
  end

  def schedule_params
    params.require(:schedule_times).permit(:date, :time, :users_id)
  end
end
