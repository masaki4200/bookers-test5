class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
  	book = Book.find(params[:book_id])
            favorite = current_user.favorites.new(book_id: book.id)
            favorite.save
            redirect_to request.referer
        # if params[:iine]
        #     redirect_to books_path
       	# else
        # 	redirect_to book_path(book)
        # end

  end

  def destroy
  	book = Book.find(params[:book_id])
            favorite = current_user.favorites.find_by(book_id: book.id)
            favorite.destroy
            redirect_to request.referer
        # if params[:iine]
        #     redirect_to books_path
       	# else
        # 	redirect_to book_path(book)
        # end
  end


  # private
  # def iine_params
  # 		params.require(:iine).permit("all")
  # end
end
