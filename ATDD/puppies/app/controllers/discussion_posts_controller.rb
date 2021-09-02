class DiscussionPostsController < ApplicationController
  skip_before_action :authorize, raise: false
  respond_to :html, :json


  def index
    @discussion_posts = DiscussionPost.all.order(:lft)
  end

  def new
    parent_id = params[:parent] || nil
    @discussion_post = DiscussionPost.new
    @discussion_post.parent_id = parent_id if parent_id
    respond_modal_with @discussion_post
  end

  def create
    parent = nil
    parent_id = params[:parent] || nil
    parent = Discussion.find(params["parent"]) unless parent_id.nil?
    @discussion_post = DiscussionPost.create(discussion_post_params)

    @discussion_post.add_child(parent) unless parent.nil?

    respond_modal_with @discussion_post, location: discussion_posts_path
  end

  private

  def discussion_post_params
    params.require(:discussion_post).permit(:nickname, :subject, :body, :parent, :parent_id)
  end
end
