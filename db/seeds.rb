users = User.create!([
  { name: 'Sergey', email: 'test1@gmail.com', password: '12345' },
  { name: 'Alex', email: 'test2@gmail.com', password: '54321' }
])

categories = Category.create!([
  { title: 'Frontend' },
  { title: 'Backend' }
])

tests = Test.create!([
  { title: 'HTML', level: 0, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Rails', level: 0, category_id: categories[1].id, author_id: users[0].id }
])

questions = Question.create!([
  { text: 'Что такое HTML?', test_id: tests[0].id },
  { text: 'Год выхода HTML?', test_id: tests[0].id },
  { text: 'Что такое Rails?', test_id: tests[1].id },
  { text: 'Год выхода Rails?', test_id: tests[1].id }
])

answers = Answer.create!([
  { text: 'Язык программирования', correct: false, question_id: questions[0].id },
  { text: 'Язык разметки', correct: true, question_id: questions[0].id },
  { text: 'Фреймворк', correct: false, question_id: questions[0].id },
  { text: 'Каскадные таблицы стилей', correct: false, question_id: questions[0].id },

  { text: '1980', correct: false, question_id: questions[1].id },
  { text: '1990', correct: true, question_id: questions[1].id },
  { text: '2000', correct: false, question_id: questions[1].id },
  { text: '2005', correct: false, question_id: questions[1].id },

  { text: 'Язык программирования', correct: false, question_id: questions[2].id },
  { text: 'Язык разметки', correct: false, question_id: questions[2].id },
  { text: 'Фреймворк', correct: true, question_id: questions[2].id },
  { text: 'Каскадные таблицы стилей', correct: false, question_id: questions[2].id },

  { text: '1998', correct: false, question_id: questions[3].id },
  { text: '2000', correct: false, question_id: questions[3].id },
  { text: '2004', correct: true, question_id: questions[3].id },
  { text: '2007', correct: false, question_id: questions[3].id }
])

results = Result.create!([
  { score: 2, user_id: users[1].id, test_id: tests[0].id },
  { score: 1, user_id: users[1].id, test_id: tests[1].id }
])