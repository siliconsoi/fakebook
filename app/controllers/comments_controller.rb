class CommentsController < ApplicationController
  def new
  end

  def create
    # Comment.new(params[:comment].merge(:user => current_user)).save
    comment = Comment.new(params[:comment].merge(:user => current_user)).save
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.json do
        self.formats = [:html]
        content = render_to_string :partial => 'partial/post', :locals => {:posts => [post]}
        render :json => {:post => content }
      end
    end
  end
end
