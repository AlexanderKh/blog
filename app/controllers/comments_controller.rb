class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :set_article, only: [:create, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.article = @article
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.json { render json: @comment, status: :created }
        format.js   { }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.json { render json: @comment, status: :ok }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_article
      @article = Article.find(params[:article_id])
    end
end
