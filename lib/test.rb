# Test class
class Test
  attr_reader :points

  def initialize(questions, results)
    @questions = questions
    @results = results
    @points = 0
    @current_question = 0
  end

  def next_question
    @questions[@current_question]
  end

  def add_point(answer_to_question)
    @points += 2 if answer_to_question == 1
    @points += 1 if answer_to_question == 2
  end

  def step_next_question
    @current_question += 1
  end

  def finished?
    @current_question >= @questions.length
  end

  def result
    case @points
    when 30..32
      @results[0]
    when 25..29
      @results[1]
    when 19..24
      @results[2]
    when 14..18
      @results[3]
    when 9..13
      @results[4]
    when 4..8
      @results[5]
    else
      @results[6]
    end
  end
end
