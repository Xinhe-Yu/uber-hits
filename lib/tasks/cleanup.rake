namespace :cleanup do
  desc 'Delete past availabilities'
  task delete_past_availabilities: :environment do
    FightersAvailability.delete_past_availabilities
    puts "Past availabilities have been deleted."
  end
end
