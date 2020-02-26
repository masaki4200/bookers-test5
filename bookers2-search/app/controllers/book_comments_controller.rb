class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    # @book_comment.book_id = current_user.book
    comment.book_id = @book.id
    comment.save
    redirect_to request.referer
	end

	def destroy
		@book = Book.find(params[:book_id])
            comment = current_user.book_comments.find_by(params[:book_comment_id])
            comment.destroy
            redirect_to request.referer
	end


	private
def book_comment_params
    params.require(:book_comment).permit(:comment)
end
end

