users = User.create!([
  { first_name: 'Sergey', last_name: 'Gildenshtern', email: 'test1@gmail.com', password: '123456',
    confirmed_at: '2022-01-20 14:54:42.853778213', type: 'Admin' },
  { first_name: 'Alex', email: 'test2@gmail.com', password: '123456', confirmed_at: '2022-01-20 14:54:42.853778213' }
])

categories = Category.create!([
  { title: 'Frontend' },
  { title: 'Backend' }
])

tests = Test.create!([
  { title: 'HTML', level: 0, category: categories[0], author: users[0] },
  { title: 'Rails', level: 0, category: categories[1], author: users[0] }
])

questions = Question.create!([
  { text: 'Что такое HTML?', test: tests[0] },
  { text: 'Год выхода HTML?', test: tests[0] },
  { text: 'Что такое Rails?', test: tests[1] },
  { text: 'Год выхода Rails?', test: tests[1] }
])

Answer.create!([
  { text: 'Язык программирования', correct: false, question: questions[0] },
  { text: 'Язык разметки', correct: true, question: questions[0] },
  { text: 'Фреймворк', correct: false, question: questions[0] },
  { text: 'Каскадные таблицы стилей', correct: false, question: questions[0] },

  { text: '1980', correct: false, question: questions[1] },
  { text: '1990', correct: true, question: questions[1] },
  { text: '2000', correct: false, question: questions[1] },
  { text: '2005', correct: false, question: questions[1] },

  { text: 'Язык программирования', correct: false, question: questions[2] },
  { text: 'Язык разметки', correct: false, question: questions[2] },
  { text: 'Фреймворк', correct: true, question: questions[2] },
  { text: 'Каскадные таблицы стилей', correct: false, question: questions[2] },

  { text: '1998', correct: false, question: questions[3] },
  { text: '2000', correct: false, question: questions[3] },
  { text: '2004', correct: true, question: questions[3] },
  { text: '2007', correct: false, question: questions[3] }
])

Result.create!([
  { score: 2, user: users[1], test: tests[0] },
  { score: 1, user: users[1], test: tests[1] }
])