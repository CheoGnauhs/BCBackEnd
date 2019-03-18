json.array! @headless do |thread|
  json.(thread, :id, :content, :item_id, :created_at)
  json.author(thread.user, :id, :handle, :avatar)

  json.replies @replies[thread.id] do |reply|
    json.(reply, :id, :thread_id, :content, :item_id, :created_at)
    json.author(reply.user, :id, :handle, :avatar)
    json.replyto(thread.user.handle)
  end
end