first_name = %w[Walton Eva Valencia]
last_name = %w[Jones Taylor Murry]
email = %w[jones.walton@ex.com eva.taylor@ex.com, valencia.murry@ex.com]
phone_numbers = %w[1234567890 9867854422 1234567898]
date = Date.today

3.times {|m| Member.create(first_name: first_name[m], last_name: last_name[m], email: email[m], phone_numbers: phone_number[m])}
member_ids = Member.ids

5.times {|g| Game.create!(title: "Game #{g+1}", end_at: date, participants_attributes: [{member_id: member_ids[0], score: rand(100)}, {member_id: member_ids[1], score: rand(100)}]) }
5.times {|g| Game.create!(title: "Game #{g+1}", end_at: date, participants_attributes: [{member_id: member_ids[2], score: rand(100)}, {member_id: member_ids[1], score: rand(100)}]) }
