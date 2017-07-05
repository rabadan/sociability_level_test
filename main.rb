require_relative "console_io"
require_relative "test"

puts "Оценка уровня общительности (тест В.Ф. Ряховского) v0.2"
puts "Тест содержит возможность определить уровень коммуникабельности человека. " \
  "Отвечать на вопросы следует используя три варианта ответов – «да», «иногда» и «нет»."

io = ConsoleIo.new
questions = io.load_data("./data/questions.txt")
results = io.load_data("./data/results.txt")

test = Test.new(questions, results)

# Задаем вопросы, пока не закончатся
until test.finished?
  # спрашиваем вопрос
  answer_to_question = io.ask_next_question(test.next_question)
  # добавляем очки
  test.add_point(answer_to_question)
  # задаем следуйщий вопрос
  test.step_next_question
end

# выводим результат
io.print_result(test.points, test.result)
