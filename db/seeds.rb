require 'faker'

# Clear existing records only if you want to reset the database
# Uncomment these lines if you want to start fresh each time you seed
# User.destroy_all
# Profile.destroy_all
# AccessLog.destroy_all
# AccessPoint.destroy_all

# Create 10 access points
10.times do
  AccessPoint.create!(
    location: Faker::Address.full_address,
    access_level: rand(1..5),
    description: Faker::Lorem.sentence,
    status: [true, false].sample
  )
end

# Create 50 users with profiles and access logs
50.times do
  password = Faker::Internet.password(min_length: 8) # Generate the password first

  user = User.create!(
    username: Faker::Internet.username,
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password, # Set the password for Devise
    password_confirmation: password, # Ensure password confirmation matches
    role: %w[admin editor viewer shipping_agent logistics_manager].sample, # Assign a random role directly
    access_level: rand(1..5),
    status: [true, false].sample
  )

  # Create a profile for each user
  Profile.create!(
    user: user,
    bio: Faker::Lorem.sentence,
    location: Faker::Address.city,
    avatar: Faker::Avatar.image
  )

  # Optionally, create some access logs for each user
  rand(1..5).times do
    AccessLog.create!(
      user: user,
      access_point_id: rand(1..10), # Now we have 10 access points to reference
      timestamp: Time.now,
      successful: [true, false].sample
    )
  end
end

puts "Created #{User.count} users, #{Profile.count} profiles, and #{AccessLog.count} access logs."
puts "Created #{AccessPoint.count} access points."