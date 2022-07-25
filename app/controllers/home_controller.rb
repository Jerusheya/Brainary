class HomeController < ApplicationController
  def index
  end

  def books 
  end
  def review
  end
  def donate_books
  
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

end
