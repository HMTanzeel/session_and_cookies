class CommentsController < ApplicationController
  def new
    @comment = Comment.new(author: cookies[:commenter_name])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Thanks to your comment!"
      if params[:remember_name]
        cookies[:commenter_name] = @comment.author
      else
        cookies.delete(:commenter_name)
      end
      redirect_to @comment.article
    else
      render action: "new"
    end
  end
end
