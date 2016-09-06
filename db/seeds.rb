Friend.delete_all
User.delete_all
Drone.delete_all

Friend.create(first_name: "Jen", last_name: "Miller", user_id: 1, email: "e@b.com", phone_number: "+14153744012")

User.create(first_name: "Bill", last_name: "Miller", email:"e@c.com", password: "123456",phone_number: "+14153744012")

Drone.create(name: "Patricia", server_address: "http://172.16.50.232:8080/start", user_id: 1)

