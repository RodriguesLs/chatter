# frozen_string_literal: true

# Top level comment
class PostsReflex < ApplicationReflex

  def repost
    post = Post.find(element.dataset[:id])
    post.increment! :reposts_count

    cable_ready['timeline'].text_content(
      selector: "#post-#{post.id}-reposts",
      text: post.reposts_count
    ).broadcast

    morph :nothing
  end

  def like
    post = Post.find(element.dataset[:id])
    post.increment! :likes_count

    cable_ready['timeline'].text_content(
      selector: "#post-#{post.id}-likes",
      text: post.likes_count
    ).broadcast

    morph :nothing
  end
end
