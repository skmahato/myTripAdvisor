namespace :searches do
  desc "Delete search records older than 1 day"
  task delete_1_day_old: :environment do
    Search.where(['created_at < ?', 1.day.ago]).destroy_all
  end

end
