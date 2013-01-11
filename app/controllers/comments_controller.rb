class CommentsController < ApplicationController

  def create
    comment = Comment.for_user(current_user, params[:comment])
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.json do
        self.formats = [:html]
        content = render_to_string :partial => 'partial/each_comment', :locals => {:comments => [comment]}
        render :json => {:comment => content }
      end
    end
  end

  def destroy
    Comment.find(params[:id]).delete
    redirect_to posts_path
  end
end
