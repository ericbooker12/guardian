Drone.delete_all
Event.delete_all
User.delete_all
Friend.delete_all

User.create(first_name: "Bill", last_name: "Miller", email:"e@c.com", password: "123456",phone_number: "+14153744012")

Friend.create(first_name: "Jen", last_name: "Miller", user_id: 1, email: "e@b.com", phone_number: "+14153744012")

Drone.create(name: "Patricia", server_address: "http://172.16.50.232:8080/start", user_id: 1)

Event.create(temp_url: "http://guardian.pagekite.me", permanent_url: "http://guardian.pagekite.me", user_id: 1, drone_id: 1)