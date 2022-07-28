class HomeController < ApplicationController
  def index
  end

  def books 
  end
  def donate_books
  
  end
  def create_review
    @review = Review.new(review_params)
    @review[:users_id] = current_user.id
    if @review.save
    render "review"
    end
  end
  def create_donate
   @donatinglist = DonatingList.new(donate_params)
   if @donatinglist.save
   render "donate_books"
   end
  end

  private
    def donate_params
      params.require(:donate).permit(:name,:book_name,:mobile,:address)
    end
    def review_params
      params.require(:review).permit(:review_description,:review)
    end
end
