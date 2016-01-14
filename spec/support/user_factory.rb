class UserFactory

  def self.create_users(number)
    users = []
    (number).times do |index|
      users << User.create(user_params(index))
    end
    users
  end

  def self.user_params(index)
    { first_name: first_names[index],
      last_name: last_names[index],
      username: usernames[index],
      password: passwords,
      password_confirmation: passwords }
  end

  def self.first_names
    ["Jordan",
     "Greg",
     "Beth",
     "Dog"]
  end

  def self.last_names
    ["Lawler",
     "Armstrong",
     "Sebian",
     "Bounty-Hunter"]
  end

  def self.usernames
    ["jlawlz",
     "homedepot",
     "luvbieber23",
     "dchebg"]
  end

  def self.passwords
    "password"
  end

end
