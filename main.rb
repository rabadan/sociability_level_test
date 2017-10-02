require_relative 'lib/console_io'
require_relative 'lib/test'

puts 'Оценка уровня общительности (тест В.Ф. Ряховского) v0.3'
puts 'Тест содержит возможность определить уровень коммуникабельности ' \
  'человека. Отвечать на вопросы следует используя три ' \
  'варианта ответов – «да», «иногда» и «нет».'

io = ConsoleIo.new
questions = io.load_data('./data/questions.txt')
results = io.load_data('./data/results.txt')

test = Test.new(questions, results)

# Ask questions until it's over.
until test.finished?
  answer_to_question = io.ask_next_question(test.next_question)
  test.add_point(answer_to_question)
  test.step_next_question
end

io.print_result(test.points, test.result)
