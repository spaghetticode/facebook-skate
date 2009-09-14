Factory.define :user do |u|
  u.sequence(:facebook_id) {|n| n}
  u.association :rank
end

Factory.define :rank do |r|
  r.sequence(:name) {|n| n}
  r.sequence(:level) {|n| n}
  r.sequence(:min_experience) {|n| n * 100}
end

Factory.define :trick do |t|
  t.sequence(:name) {|n| "ollie #{n}"}
  t.difficulty 1
  t.association :rank
end

Factory.define :item do |i|
  i.name 'wheels'
  i.description '4 wheels'
  i.price 10
  i.association(:rank)
  i.image 'imagepath'
  i.quantity 10
  i.attribute 'stamina'
end