# frozen_string_literal: true

class Posts::PostCommentsController < Posts::ApplicationController

  def new
    @post_comment = PostComment.new
  end

  def edit
    @post_comment = PostComment.find params[:id]
  end

  def create
    @post_comment = Post.find(params[:post_id]).post_comment.build(post_params)

    if @post_comment.save
      redirect_to post_path(Post.find(params[:post_id])), notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post_comment = PostComment.find params[:id]

    if @post_comment.update(post_params)
      redirect_to @post_comment, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post_comment = PostComment.find params[:id]

    @post_comment.destroy

    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post_comment).permit(:title, :body)
  end
end
