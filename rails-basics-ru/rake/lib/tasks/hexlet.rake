namespace :hexlet do
  desc 'Import users'
  task :import_users => :environment do
    require 'csv'
    CSV.foreach("test/fixtures/files/users.csv") do |row|
      puts row[0]
      puts User.create(first_name: row[0], last_name: row[1], birthday: row[2], email: row[3]).id
    end
  end
 end