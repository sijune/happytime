namespace :posts do
  desc "Delete records older than 5 minutes"
  task auto_delete_post: :environment do
    Post.where(['created_at < ?', 2.minutes.ago]).destroy_all
  end

end
