users = User.create([
  { name: 'Sergey', email: 'test1@gmail.com', password: '12345' },
  { name: 'Alex', email: 'test2@gmail.com', password: '54321' }
])

categories = Category.create([
  { title: 'Frontend' },
  { title: 'Backend' }
])

tests = Test.create([
  { title: 'HTML', level: 0, category: categories[0], author: users[0] },
  { title: 'Rails', level: 0, category: categories[1], author: users[0] }
])

questions = Question.create([
  { text: 'Что такое HTML?', test: tests[0] },
  { text: 'Год выхода HTML?', test: tests[0] },
  { text: 'Что такое Rails?', test: tests[1] },
  { text: 'Год выхода Rails?', test: tests[1] }
])

answers = Answer.create([
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

results = Result.create([
  { score: 2, user: users[1], test: tests[0] },
  { score: 1, user: users[1], test: tests[1] }
])