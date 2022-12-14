require 'faker'

City.destroy_all
Tag.destroy_all
User.destroy_all
Gossip.destroy_all
Gossiptag.destroy_all
PrivateMessage.destroy_all

10.times do |t|
    City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code,)
end

10.times do |t|
    title = Faker::Emotion.noun.downcase
    title.gsub!(/\s+/, '-')
    Tag.create(
      title: title,
    )
  end


10.times do |t|
    User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentences, email: Faker::Internet.email, age:  Faker::Number.between(from: 0, to: 100), city: City.all.sample,)
end

20.times do |t|
    Gossip.create(title: Faker::Movie.title[0..11], content: Faker::Quote.matz, user: User.all.sample,)
end

10.times do |t|
    Gossiptag.create(tag: Tag.all.sample, gossip: Gossip.all.sample,)
end

15.times do |t|
    PrivateMessage.create(recipient: User.all.sample, sender: User.all.sample, content: Faker::Movie.quote,)
end 

