# Class input output
class ConsoleIo
  def print_result(points, result)
    puts "\n Вы набрали #{points} баллов:"
    puts result
  end

  def ask_next_question(next_question)
    puts "\n#{next_question}"

    answer_to_question = 0
    until answer_to_question.between?(1, 3)
      puts 'Ваш ответ: 1 — да, 2 — иногда, 3 — нет'
      answer_to_question = STDIN.gets.to_i
    end

    answer_to_question
  end

  def load_data(file_path)
    abort "Файл не найден: #{file_path}" unless File.exist?(file_path)

    f = File.new(file_path, 'r:UTF-8')
    data = f.readlines
    f.close

    data
  end
end
