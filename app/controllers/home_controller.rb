# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :role_display
  #home page redirection
  def index
  end
 
  #book page redirection
  def book
    @cat = Category.all
    @list = Book.all
    @review = Review.all
  end

  #category page redirection function
  def category
  end

  #adding  category  function
  def add_category
    @categories = Category.new(category_params)

    render plain: 'Success' if @categories.save
  end

  #book creating function
  def book_create
    @books = Book.new(book_params)
    @books.book_pic.attach(book_params[:book_pic])
    @category = Category.find_by_category_name(params[:book][:category])
    @books.categories_id = @category.id
    @review = Review.all
    @cat = Category.all
    @list = Book.all
    render 'book' if @books.save
  end
  #book available function
  def available 
    @comp = Book.find(params[:id])    
    @comp[:status] = false    
    if @comp.save  
      @list = Book.all
      redirect_to '/book' 
    end
  end

  #book unavailability function
  def unavailable 
    @comp = Book.find(params[:id])    
    @comp[:status] = true    
    if @comp.save  
      @list = Book.all
      redirect_to '/book' 
    end
  end

  #book deleting function
  def delete_book
    @del_book = Book.find(params[:id]) 
    if @del_book.destroy 
      @list = Book.all
      redirect_to "/book" 
    end
  end

  #donate page redirection function 
  def donate_books
    @donatelist = DonateBook.all
    @suggestlist = SuggestBook.all
  end

  #booklist showing page redirection
  def booklist_showing
    @list = Book.all
    @review = Review.all
  end

  #donate list showing redirection
  def donatelist_showing
    @donatelist = DonateBook.all
  end

  #schedule page redirection function
  def schedule
    @list = Book.all
    @schedule_details = ScheduleTime.all
   if current_user
    @sch = ScheduleTime.where(users_id: current_user.id)
   end

  end

  def scheduleList
    @schedule_details = ScheduleTime.all

  end
  #storing schedule function
  def schedule_post
    @schedule_inputs = ScheduleTime.new(schedule_params)
    @schedule_inputs[:users_id] = current_user.id
    @booklists = Book.find_by_name(params[:schedule_times][:book_name_id])
    @schedule_inputs.books_id = @booklists.id
    redirect_to '/schedule' if @schedule_inputs.save
  end

  def delete_slot
    @del_slot = ScheduleTime.find(params[:id]) 
    if @del_slot.destroy 
      @schedule_details = ScheduleTime.all
      redirect_to "/schedule" 
    end
  end

  #creating review and submission function
  def create_review
    @review = Review.all
    @review_new = Review.new(review_params)
    @review_new[:users_id] = current_user.id
    redirect_to '/book' if @review_new.save
  end

  #donating book submission function
  def create_donate
    @donatinglist = DonateBook.new(donate_params)
    if @donatinglist.save
      render 'donate_books' 
    end
  end
  def delete_donate
    @del_donate = DonateBook.find(params[:id]) 
    if @del_donate.destroy 
      @schedule_details = DonateBook.all
      redirect_to "/donate_books" 
    end
  end
  #suggesting book submission function
  def suggestingbooks
    @suggest = SuggestBook.new(suggest_books_params)
    if current_user!=nil
     @suggest[:user_name] = User.find(current_user.id).name
    else  
      @suggest[:user_name] = "unknown"
    end
    if @suggest.save
       render 'donate_books' 
    end
  end
  def delete_suggest
    @del_suggest = SuggestBook.find(params[:id]) 
    if @del_suggest.destroy 
      @schedule_details = SuggestBook.all
      redirect_to "/donate_books" 
    end
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
    params.require(:suggest_books).permit(:option, :Book_Or_Author_Name)
  end

  def schedule_params
    params.require(:schedule_times).permit(:date, :time, :users_id)
  end
  def role_display
    if current_user
      @role  = User.find(current_user.id)
    end
  end
end