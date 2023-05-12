# frozen_string_literal: true

# CommentsController
class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save!

    redirect_back_or_to params[:commentable]
  end

  private

  def comment_params
    params.require(:comment).permit(:body,
                                    :commentable_type,
                                    :commentable_id,
                                    :user_id)
  end
end
