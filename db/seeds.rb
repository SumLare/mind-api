image = File.open(Rails.root.join('public', 'blank.jpg'))
video = File.open(Rails.root.join('public', 'blank.mp4'))

foo = User.create!(
  first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.com', password: 'qwerty123'
)

foo.update!(api_token: 'foobar')
foo.avatar.attach(image)

elon = User.create!(
  first_name: 'Elon', last_name: 'Musk', email: 'bar@baz.com', password: 'qwerty123'
)
elon.avatar.attach(image)

aaron = User.create!(
  first_name: 'Aaron', last_name: 'aaron', email: 'aaron@aaron.com', password: 'qwerty123'
)

question = Question.create!(
  content: 'Out believe has request not how comfort evident. Up delight cousins we feeling minutes. Genius?',
  user: foo, respondent: elon
)

question2 = Question.create!(
  content: 'She enabled invited exposed him another. Reasonably conviction solicitude me mr at discretion?',
  user: aaron, respondent: foo
)

question3 = Question.create!(
  content: 'We diminution preference thoroughly if. Joy deal pain view much her time. Pronounce we attention?',
  user: elon, respondent: foo
)

Answer.create!(question: question, video: video)
Answer.create!(question: question2, video: video)
Answer.create!(question: question3, video: video)
