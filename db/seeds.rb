user = User.create!(
  first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.com', password: 'qwerty123'
)

user.update!(api_token: 'foobar')
