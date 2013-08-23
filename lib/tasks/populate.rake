namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do 
		10.times do |n|
			puts "[DEBUG] creating user #{n+1} of 10"
			name = Faker::Name.name
			email = "user-#{n+1}@example.com"
			password = "password"
			User.create!( name: name,
										email: email,
										password: password,
										password_confirmation: password)
		end
		
		User.all.each do |user|
			puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"
			10.times do |n|
				image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)	
				description = ["Join us.", "Let's have a blast!", "Welcome home.", "So much fun.", "Space is limite."].sample
				title = ["Sports Game", "Dinner Event", "Family Fun", "Explore", "Exclusive Event"].sample
				location = %w(north south east west suburbs).sample
				user.events.create!(image: image, description: description, title: title, location: location)
			end
		end			
	end	
end